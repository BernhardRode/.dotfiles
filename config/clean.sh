#!/bin/sh

# Read folder names line by line from the "out" file
while IFS= read -r folder_name; do

  # Check if the folder exists before attempting removal
  if [ -d "$folder_name" ]; then

    echo "Removing folder '$folder_name' from Git..."
    # Use `git rm -rf --cached "$folder_name"` for forceful removal (if needed)
    git rm -r --cached "$folder_name" # Prefer non-forceful removal

    # Check for successful Git operation (exit code 0 indicates success)
    if [ $? -eq 0 ]; then
      echo "Successfully removed '$folder_name' from Git."

      # Add the folder to the .gitignore file (append mode)
      echo "$folder_name" >>.gitignore
      echo "Added '$folder_name' to .gitignore."
    else
      echo "Error: Failed to remove '$folder_name' from Git. Check for errors."
    fi
  else
    echo "Warning: Folder '$folder_name' not found. Skipping removal and gitignore addition."
  fi

done <"out"
