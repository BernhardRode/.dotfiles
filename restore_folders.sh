#!/usr/bin/env sh

# Define the folders you want to restore (separated by spaces)
folders=("bin" "LICENSE" "config" "ignore")

# Loop through each folder and find its latest commit, then restore it
for folder in "${folders[@]}"
do
  # Get the latest commit that modified the folder
  latest_commit=$(git log -n 1 --pretty=format:%H -- "$folder")

  # Check if the folder exists in any commit
  if [ -n "$latest_commit" ]; then
    echo "Restoring $folder from commit $latest_commit..."

    # Checkout the folder from its latest commit
    git checkout "$latest_commit" -- "$folder"

    # Stage the folder for commit
    git add "$folder"

    # Commit the restored folder with a message
    git commit -m "chore: Recovered folder $folder from commit $latest_commit"
    echo "$folder has been restored and committed."
  else
    echo "No commits found for folder $folder. Skipping..."
  fi
done

echo "All specified folders processed."
