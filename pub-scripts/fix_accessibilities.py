import re
from lxml import html
from lxml import etree
import glob
from pathlib import Path
import argparse
import time
import zipfile
import tempfile
import shutil

#SAFR Content IG does not utilize the NHSN-MS label
support_nhsn_ms_tagging = False

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

accessibility_update_file_patterns = ['**/qa*.html', '**/StructureDefinition-*.html', '**/StructureDefinition-*.xml']


def main():
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

    print("Processing full_ig.zip: " + str(Path(target_folder + "/full-ig.zip")))

    fix_zip_file_accessibilities(Path(target_folder + "/full-ig.zip"))
    end = time.time()
    print("Full execution time (in seconds)", end - start)

def fix_accessibilities_in_folder(folder_path = default_folder):

    for pattern in accessibility_update_file_patterns:
        for filepath in glob.glob(folder_path + pattern, recursive=True):
            fix_accessibility_in_file(filepath)

def fix_accessibility_in_file(file_path):
  print("Updating file for Section 508 compliance: " + file_path)
  #from lxml import etree
  tree = html.parse(file_path)

  # Replace all opacity of 0.5 with 0.87
  
  elements_with_style = tree.xpath("//*[@style]")

  for element in elements_with_style:
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
        #print(desc_element[0].text)
        # if nhsn_ms_label in desc_element[0].text:
        #   # TODO Replace the 
        #   print(desc_element[0].text)
        #   exit()
        
        if support_nhsn_ms_tagging:
          has_ms_label = False
          if nhsn_ms_label in desc_element[0].text:
            has_ms_label = True
            description_text = etree.tostring(desc_element[0], pretty_print=True, encoding='unicode')
            description_text = description_text.replace(nhsn_ms_label, '<div title="' + nhsn_ms_message + '" style="display: inline-block;">' + nhsn_ms_label + '</div>')
            #print(description_text)
            new_description = html.fromstring(description_text)
            #print(etree.tostring(new_description, pretty_print=True, encoding='unicode'))
            parent = desc_element[0].getparent()
            parent.replace(desc_element[0], new_description)
          for span in ms_element:
            #print("Span Text: " + span.text +" ; has label: " + str(has_ms_label) + "; in desc: " + desc_element[0].text)
            if span.text == 'S':
              if has_ms_label:

                # Found a Must Support that is not marked as NR or NRT, change to bold
                #print("Bold " + ms_element[0].text)
                span.attrib["title"] = nhsn_ms_message
                replace_style(span, "font-weight", "400", replace_only_if_exists=False)
                replace_style(span, "background-color", new_red, replace_only_if_exists=True)
                
              else:
                # Found a Must Support that is marked as NR or NRT, change to italic
                #print("Italic " + ms_element[0].text)
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


  with open(file_path, "wb") as f:
    f.write(html.tostring(tree, pretty_print=True, encoding='utf-8'))

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
    if(Path(string).is_dir()):
      return string
    else:        
      print("Folder does not exist: " + string)

if __name__ == "__main__":
    main()