#!/bin/bash

# Define the folder containing the CQL files
folder_path="input/cql"

# Define the GitHub repository
repo="lantanagroup/nhsn-measures"

# Check if GitHub PAT is available
if [[ -z "$PAT" ]]; then
  echo "Error: GITHUB_PAT environment variable is not set."
  echo "Please ensure the GitHub Personal Access Token is configured in your ADO variable group."
  exit 1
fi

# Construct the authenticated repository URL
repo_url="https://${PAT}@github.com/${repo}.git"

# Alternative: Use GitHub API to get release information without cloning
echo "Fetching release information from GitHub API..."

# Function to get releases via GitHub API
get_latest_release() {
  local api_url="https://api.github.com/repos/${repo}/releases/latest"
  local response=$(curl -s -H "Authorization: token ${PAT}" "$api_url")
  
  # Check if the API call was successful
  if echo "$response" | grep -q '"tag_name"'; then
    latest_release=$(echo "$response" | grep '"tag_name"' | sed -E 's/.*"tag_name": "([^"]+)".*/\1/')
    latest_release_url=$(echo "$response" | grep '"html_url"' | head -1 | sed -E 's/.*"html_url": "([^"]+)".*/\1/')
    echo "Latest release version: $latest_release"
    echo "Latest release URL: $latest_release_url"
    return 0
  else
    echo "No releases found or API error."
    return 1
  fi
}

# Function to list all releases
list_all_releases() {
  local api_url="https://api.github.com/repos/${repo}/releases"
  local response=$(curl -s -H "Authorization: token ${PAT}" "$api_url")
  
  echo "All available releases:"
  echo "$response" | grep '"tag_name"' | sed -E 's/.*"tag_name": "([^"]+)".*/\1/' | head -10
}

# Try to get release information via API first (faster than cloning)
if get_latest_release; then
  list_all_releases
else
  echo "API method failed, falling back to git clone method..."

# Create a temporary directory for cloning
temp_dir=$(mktemp -d)
trap "rm -rf $temp_dir" EXIT

  # Create a temporary directory for cloning
  temp_dir=$(mktemp -d)
  trap "rm -rf $temp_dir" EXIT

  echo "Cloning repository to get release information..."

  # Clone the repository (shallow clone for efficiency)
  if git clone --depth 1 "$repo_url" "$temp_dir/repo" 2>/dev/null; then
    cd "$temp_dir/repo"
    
    # Fetch tags using authenticated URL
    git fetch --tags origin 2>/dev/null
    
    # Get the latest tag (assuming semantic versioning or chronological tagging)
    latest_release=$(git tag --sort=-version:refname | head -n 1)
    
    if [[ -n "$latest_release" ]]; then
      latest_release_url="https://github.com/${repo}/releases/tag/${latest_release}"
      echo "Latest release version: $latest_release"
      echo "Latest release URL: $latest_release_url"
      
      # List all tags for reference
      echo "All available tags:"
      git tag --sort=-version:refname | head -10
    else
      echo "No tags/releases found in the repository."
      latest_release="none"
      latest_release_url="No previous release available."
    fi
    
    # Return to original directory
    cd - > /dev/null
  else
    echo "Failed to clone repository. Setting default values."
    latest_release="none"
    latest_release_url="No previous release available."
  fi
fi

# Initialize the Markdown table
markdown_table="| Measure Name | Version | New Version? |\n|--------------|---------|---------------|\n"


# Loop through all files in the folder
for file_path in "$folder_path"/NHSN*.cql; do
  if [[ -f "$file_path" ]]; then
    # Get the file name
    file_name=$(basename "$file_path")
    
    # Skip the file NHSNHelpers.cql
    if [[ "$file_name" == "NHSNHelpers.cql" ]]; then
      continue
    fi

    # Extract the first line of the file
    first_line=$(head -n 1 "$file_path")
    
    # Use regex to extract the version number
    if [[ $first_line =~ version[[:space:]]\'([^\']+)\' ]]; then
      version="${BASH_REMATCH[1]}"
      
      # Compare the version with the latest release
      if [[ "$version" == "$latest_release" ]]; then
        new_version="No"
      else
        new_version="Yes"
      fi

      # Append the file name, version, and comparison result to the Markdown table
      markdown_table+="| $file_name | $version | $new_version |\n"
    fi
  fi
done

# Add a footnote with the link to the latest release
if [[ "$latest_release_url" != "No previous release available." ]]; then
  markdown_table+="\n*Note: The previous release can be found [here]($latest_release_url).*\n"
else
  markdown_table+="\n*Note: No previous release is available.*\n"
fi

# Output the Markdown table to a file
echo -e "$markdown_table" > cql_versions.md

# Print the table to the console for debugging
echo -e "$markdown_table"