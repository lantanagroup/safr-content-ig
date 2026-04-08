"""
This module provides a script to fix accessibility issues in the generated HTML and ZIP files of the FHIR IG Publisher output. The script processes HTML files in the specified output folder, targeting specific tables and elements to update their styles for better compliance with Section 508 accessibility standards. It also handles the special case of Must Support elements in the differential tables, applying different styling based on whether they are marked as Not Required (NR) or Not Required for Testing (NRT) or (NHSN-MS) in the description. Additionally, the script can process a ZIP file containing the full IG output, extracting it, applying the necessary fixes to the HTML files within, and then rebuilding the ZIP file with the updated content. The script uses the `lxml` library to parse and manipulate the HTML content, and it can be configured to modify colors and styles as needed for better accessibility.
THis module is intended to be run as a post-processing step after the IG Publisher has generated the HTML and ZIP file output, and it can be invoked from the command line with the path to the output folder to process.
It can be run through the CLI workflow in `cli.py` or `go_publisher.py` by using the `--access` flag, which will call the `fix_accessibilities_in_folder()` function on the generated output folder.
However, It can be run separately from the CLI workflow for testing and development purposes, and to allow for flexibility in when and how it is applied to the generated output. 
"""

import os
from lxml import html
from lxml import etree
import glob
from pathlib import Path
import argparse
import time
import zipfile
import tempfile
import shutil
from datetime import datetime


#SAFR Content IG does not utilize the NHSN-MS label
support_nhsn_ms_tagging = True

target_tables = ['tbl-key-inner', 'tbl-diff-inner', 'tbl-snap-inner', 'all-tbl-key-inner', 'all-tbl-diff-inner', 'all-tbl-snap-inner']
target_table_diff = 'tbl-diff-inner'
source_file = 'test_format.html'
dest_file = 'test_format_dest.html'
nhsn_ms_label = "(NHSN-MS)"
nhsn_ms_message = "This element is Must Support for NHSN reporting."
nhsn_not_ms_message = "Must Support in a base specification.\r\nNOT needed for NHSN reporting."
default_folder = '../output/'
modify_ms_color = False
new_opacity = '0.87'
new_green = '#006600'
new_red = '#B60000'

accessibility_update_file_patterns = ['qa*.html', 'StructureDefinition-*.html', 'StructureDefinition-*.xml']


def main():
  """ CLI entrypoint for the accessibility fixer script. This function sets up argument parsing to allow the user to specify the path to the output folder to process for accessibility fixes. If no path is provided, it defaults to a predefined folder. The function then calls `fix_accessibilities_in_folder()` with the specified or default folder path to apply the accessibility fixes to the HTML and ZIP files in that folder. The execution time for the process is measured and printed at the end.
  Command-line arguments:
    - `process_path`: Positional argument specifying the path to the existing output folder to process for accessibility fixes. If not provided, it defaults to a predefined folder.
      Usage:
      
    - Run the script with the path to the output folder to process:
    ```python fix_accessibilities.py path/to/output/folder```
    - If no path is provided, it will use the default folder:
    ```python fix_accessibilities.py```
  """
  parser = argparse.ArgumentParser(description="""FHIR IG Publisher - 508 Accessibility Fixer""")
  parser.add_argument('process_path', type=existing_folder_arg, help="Path to existing output folder to process", nargs='?')    

  target_folder = default_folder
  
  args = parser.parse_args()
  if not args.process_path:
      parser.error('No processing folder specified in arguments. Using: ' + default_folder)
  else:
    target_folder = args.process_path

  start = time.time()

  fix_accessibilities_in_folder(target_folder)


  end = time.time()
  print("Full execution time (in seconds)", end - start)


def fix_accessibilities_in_folder(folder_path = default_folder):
  """
    Apply accessibility fixes to HTML and ZIP files in the specified folder. This function iterates through HTML and ZIP files in the specified folder that match certain patterns (defined in `accessibility_update_file_patterns`), and applies accessibility fixes to those files by calling `fix_accessibility_in_file()`. It also checks for the presence of a ZIP file containing the full IG output, and if found, it extracts the ZIP file, applies accessibility fixes to the HTML files within the extracted content, and then rebuilds the ZIP file with the updated content. This allows for comprehensive application of accessibility fixes to both individual HTML files and those contained within a ZIP archive of the IG output.  
    Args:
      folder_path: Path to the folder containing the HTML and ZIP files to process for accessibility fixes. This can be specified as a command-line argument when running the script, or it will default to a predefined folder if no argument is provided.

    Usage:
    - Run the script with the path to the output folder to process:
    ```python fix_accessibilities.py path/to/output/folder```
    - If no path is provided, it will use the default folder:
    ```python fix_accessibilities.py```
  """
  folder_path = ensure_trailing_slash_os(folder_path)
  for pattern in accessibility_update_file_patterns:
      for filepath in glob.glob(folder_path + pattern, recursive=True):
          fix_accessibility_in_file(filepath)
  
  print("Processing full_ig.zip: " + str(Path(folder_path + "/full-ig.zip")))

  try:  
    fix_zip_file_accessibilities(Path(folder_path + "/full-ig.zip"))
  except FileNotFoundError:
    print(f'No full-ig.zip file found in {folder_path}, skipping ZIP accessibility fixes.')

def fix_accessibility_in_file(file_path):
  print("Updating file for Section 508 compliance: " + file_path)

  parser = html.HTMLParser(encoding='utf-8')
  tree = html.parse(file_path, parser=parser)
  root = tree.getroot()

  if root is None:
    # Fallback for malformed HTML where ElementTree has no root
    raw_html = Path(file_path).read_bytes()
    root = html.fromstring(raw_html, parser=parser)
    tree = html.ElementTree(root)


  # Check to see if the file has already been processed for accessibility by looking for a meta tag we add to updated files. If the meta tag is found, skip processing to avoid modifying the file multiple times.
  meta_tags = root.xpath("//meta[@name='data-accessibility-fixed']")
  if meta_tags:
      meta = meta_tags[0]
      print(f"Found accessibility-fixed meta tag in file {file_path} with content: {meta.get('content')}")
      print(f"File {file_path} already processed for accessibility fixes, skipping.")
      return

  # Continue with processing the file for accessibility fixes if the meta tag is not found, and add the meta tag to indicate that the file has been processed. This helps prevent multiple modifications to the same file if the script is run multiple times on the same output folder.
  head = root.find('.//head')
  if head is None:
    head = etree.SubElement(root, "head")
    # Move the head to the beginning of the root element (best practice)
    root.insert(0, head) 
  if head is not None:
    # Create the new meta element with attributes
    new_meta = etree.Element("meta", name="data-accessibility-fixed", content=datetime.now().isoformat())
    
    # Append the element to the head
    head.append(new_meta)

  # Replace all opacity of 0.5 with 0.87
  
  for element in root.xpath("//*[@style]"):
    #style_attr = element.get('style')
    #if style_attr:

      # Only replace if the current opacity is 0.5
      #if "opacity: 0.5" in style_attr:
        #print(element.attrib['style'])
    #style_attr = element.get('style')
    #if style_attr:
    #print("Checking style: " + style_attr)
    
      # Only replace if the current opacity is 0.5
    
    replace_style(element, "opacity", new_opacity, old_value="0.5", replace_only_if_exists=True)
    replace_style(element, "background-color", new_green, old_value="green")
    replace_style(element, "background-color", new_red, old_value="red")

    #if style_attr:
      #print("Checking style: " + style_attr)
    
        #print(element.attrib['style'])
      # styles = {}
      # for item in style_attr.split(';'):
      #   if ':' in item:
      #     key, value = item.split(':', 1)
      #     styles[key.strip()] = value.strip()

      #   # Update the 'opacity' property if present
      #   if 'opacity' in styles:
      #     styles['opacity'] = new_opacity

      #     # Reconstruct the style attribute string
      #     new_style_attr = "; ".join([f"{key}: {value}" for key, value in styles.items()])
      #     element.attrib['style'] = new_style_attr
#target_table_diff

  for target_id in target_tables:

    if target_table_diff in target_id:
      # update the font-weight of every third td in the table within the table with id 'tbl-diff-inner' (The cardinality column of the differential table)
      td_elements = tree.xpath(f"//div[@id='{target_id}']/table[1]/tr/td[3]")

      if td_elements:

        for td in td_elements:
            #print(td.text)
          #print(td.text)
          td.attrib["style"] = td.attrib["style"].rstrip("; ") + "; font-weight: 900;"
          span_element = td.xpath(f"span")
          
          if span_element:
            for span in span_element:
              if "style" in span.attrib and "opacity" in span.attrib["style"]:
                span.attrib["style"] = span.attrib["style"].rstrip("; ") + "; font-weight: 300; font-style: italic;"
      
      # update the font-weight of every fourth td in the table within the table with id 'tbl-diff-inner' (The type column of the differential table)
      td_elements = tree.xpath(f"//div[@id='{target_id}']/table[1]/tr/td[4]")

      if td_elements:

        for td in td_elements:
            #print(td.text)
          
          td.attrib["style"] = td.attrib["style"].rstrip("; ") + "; font-weight: 900;"
          #print(td.attrib["style"])
          a_element = td.xpath(f"a")
          
          if a_element:
            for a in a_element:
              #print(a.text)
              if "style" in a.attrib and "opacity" in a.attrib["style"]:
                a.attrib["style"] = a.attrib["style"].rstrip("; ") + "; font-weight: 300; font-style: italic;"
              elif a.text == "Reference":
                if "style" in a.attrib:
                  a.attrib["style"] = a.attrib["style"].rstrip("; ") + "; font-weight: 400; font-style: italic;"
                else:
                  a.attrib["style"] = "font-weight: 400; font-style: italic;"

    
    # Apply special requirements in the QA file which does a check for a n element tagged as (NR) or (NRT) and gray out the Must Support S and bold the ones that are not
    tr_elements = tree.xpath(f"//div[@id='{target_id}']/table[1]/tr")

    for tr in tr_elements:
      ms_element = tr.xpath(f"td[2]/span")
      #print("Len of spans: " + str(len(ms_element)))

      desc_element = tr.xpath(f"td[5]")

      if not (desc_element and desc_element[0].text and len(desc_element[0].text.replace(' ', '').replace('\t', '').replace('\n', '').replace('\r', '')) > 0):
        desc_element = tr.xpath(f"td[5]/span[1]")
      
      if ms_element and (desc_element and desc_element[0].text):
        
        if support_nhsn_ms_tagging:
          has_ms_label = False
          if nhsn_ms_label in desc_element[0].text:
            has_ms_label = True
            description_text = etree.tostring(desc_element[0], pretty_print=True, encoding='unicode')
            description_text = description_text.replace(nhsn_ms_label, '<div title="' + nhsn_ms_message + '" style="display: inline-block;">' + nhsn_ms_label + '</div>')

            new_description = html.fromstring(description_text)
            parent = desc_element[0].getparent()
            parent.replace(desc_element[0], new_description)
          for span in ms_element:
            if span.text == 'S':
              if has_ms_label:

                # Found a Must Support that is not marked as NR or NRT, change to bold
                span.attrib["title"] = nhsn_ms_message
                replace_style(span, "font-weight", "400", replace_only_if_exists=False)
                replace_style(span, "background-color", new_red, replace_only_if_exists=True)
                
              else:
                # Found a Must Support that is marked as NR or NRT, change to italic
                span.attrib["title"] = nhsn_not_ms_message
                if modify_ms_color and target_table_diff in target_id:
                  replace_style(span, "font-style", "italic", replace_only_if_exists=False)
                  replace_style(span, "background-color", "#694f4f", replace_only_if_exists=True)
                else:
                  replace_style(span, "font-weight", "400", replace_only_if_exists=False)
                  replace_style(span, "background-color", new_red, replace_only_if_exists=True)


              #nhsn_ms_message
              #nhsn_not_ms_message
            # and ("(NR)" in td.text or "(NRT)" in td.text):
            #   parent_td = td.getparent()
            #   if parent_td is not None:
            #     # Gray out the Must Support S
            #     parent_td.attrib["style"] = parent_td.attrib["style"].rstrip("; ") + "; color: gray;"


  try:
    tree.write(file_path, encoding='utf-8', method='html', pretty_print=True)
  except Exception as e:
    print(f"Error writing updated file {file_path}: {e}")

  #exit()


  #for diff in diffs:
  #    print(diff.text)
      #print(diff.find('tr').text)

  # if match:
  #     print(f"Match found at the beginning: {match.group()}")
  # else:
  #     print("No match at the beginning.")

  # # Example where it won't match because the pattern is not at the start
  # text2 = "world hello"
  # match2 = re.match(pattern, text2)
  # if match2:
  #     print(f"Match found: {match2.group()}")
  # else:
  #     print("No match at the beginning for text2.")

# Doccumentation for style replacement function
# Replaces a CSS property in a style attribute string with a new value.
# Parameters:
# - style_attribute: The current style attribute string.
# - property_name: The CSS property to replace or add.
# - new_value: The new value for the CSS property.
# - old_value: (Optional) The old value to match before replacing. If None, any existing value will be replaced.
# - replace_only_if_exists: If True, only replace the property if it already exists.
def replace_style(element, property_name, new_value, old_value=None, replace_only_if_exists=True):

  """
    Replace a CSS property in the style attribute of an HTML element with a new value. This function takes an HTML element, the name of the CSS property to replace, the new value for that property, and optional parameters to specify an old value to match and whether to only replace if the property already exists. It parses the existing style attribute of the element, checks for the specified property, and updates its value according to the provided parameters. If the property does not exist and `replace_only_if_exists` is False, it will add the property with the new value. The function then reconstructs the style attribute string and updates it on the element. It returns a boolean indicating whether a replacement was made.
    Parameters:
    - element: The HTML element whose style attribute is to be modified.
    - property_name: The name of the CSS property to replace or add.
    - new_value: The new value for the specified CSS property.
    - old_value: (Optional) The old value to match before replacing. If None, any existing value will be replaced.
    - replace_only_if_exists: A boolean flag indicating whether to only replace the property if it already exists in the style attribute. If True, the function will only replace the property if it is already present; if False, it will add the property with the new value if it does not exist.
    Returns:
    - A boolean indicating whether a replacement was made (True if the property was replaced or added, False otherwise).
  """
  replaced = False
  style_attr = element.get('style')
  if style_attr:
    styles = {}
    for item in style_attr.split(';'):
        if ':' in item:
            key, value = item.split(':', 1)
            styles[key.strip()] = value.strip()

    # Update the specified property if present or if not restricted to specific old value
    if property_name in styles or not replace_only_if_exists:
        if old_value is None or styles.get(property_name) == old_value:
          styles[property_name] = new_value

    # Reconstruct the style attribute string
    new_style_attr = "; ".join([f"{key}: {value}" for key, value in styles.items()])
    element.attrib['style'] = new_style_attr
    replaced = True

  return replaced

def fix_zip_file_accessibilities(zip_path: Path) -> None:
  """Fix accessibility issues in HTML files contained within a ZIP archive. This function takes the path to a ZIP file, extracts its contents to a temporary directory, applies accessibility fixes to any HTML files found within the extracted content by calling `fix_accessibility_in_file()`, and then rebuilds the ZIP file with the updated content. This allows for comprehensive application of accessibility fixes to HTML files that are contained within a ZIP archive, such as the full IG output generated by the FHIR IG Publisher. The function includes error handling for cases where the specified ZIP file does not exist or is not a valid file.
  Args:
    zip_path: The path to the ZIP file containing HTML files to fix.
  Usage:
  - Call the function with the path to the ZIP file to process:
  ```pythonfix_zip_file_accessibilities(Path('path/to/full-ig.zip'))```
  """
  zip_path = zip_path.resolve()
  if not zip_path.is_file():
      raise FileNotFoundError(f"{zip_path} does not exist or is not a file")

  with tempfile.TemporaryDirectory() as tmpdir:
      print(tmpdir)
      tmpdir = Path(tmpdir)
      extract_dir = tmpdir / "extract"
      extract_dir.mkdir()

      site_dir = extract_dir / "site"

      # Extract the original archive
      with zipfile.ZipFile(zip_path, "r") as src:
          src.extractall(extract_dir)
      print(f"Extracted files to {extract_dir}")

      # Fix accessibilities
      print(str(site_dir))
      fix_accessibilities_in_folder(str(site_dir))
      print("Fixed zip file accessibilities.")
      
      # # Update HTML files
      # for html_file in extract_dir.rglob("*.html"):
      #     text = html_file.read_text(encoding="utf-8")
      #     if OLD not in text:
      #         continue
      #     html_file.write_text(text.replace(OLD, NEW), encoding="utf-8")

      # Rebuild archive beside the original, then swap in
      rebuilt = tmpdir / "rebuilt.zip"
      
      with zipfile.ZipFile(rebuilt, "w", compression=zipfile.ZIP_DEFLATED) as dst:
          for item in extract_dir.rglob("*"):
              arcname = item.relative_to(extract_dir)
              if item.is_dir():
                  continue  # directories are implied
              dst.write(item, arcname)
      print("Rebuilt archive.")
      shutil.move(rebuilt, zip_path)

def existing_folder_arg(string):
  """
    Custom argument type for argparse to validate that a provided string is an existing folder path. This function checks if the given string corresponds to an existing directory on the filesystem. If it does, it returns the string; if not, it raises an error indicating that the specified folder does not exist. This is used in the command-line argument parsing to ensure that the user provides a valid folder path for processing.
    Args:
      string: The input string to validate as an existing folder path.
    Returns:
      The input string if it is a valid existing folder path.
    Raises:
      argparse.ArgumentTypeError: If the input string does not correspond to an existing directory.
  """
  if(Path(string).is_dir()):
    return string
  else:        
    print("Folder does not exist: " + string)

def ensure_trailing_slash_os(path_str):
  """Ensures a string path has a trailing slash using os.path.join."""
  # os.path.join will add the separator if the path is treated as a directory.
  # An easy way to force this is to join it with an empty string.
  # However, a simpler way for general use is checking and appending if needed.
  if not path_str.endswith(os.sep):
    return path_str + os.sep
  return path_str

if __name__ == "__main__":
    main()