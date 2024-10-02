#!/usr/bin/env sh

# Define the folders you want to restore (separated by spaces)
folders=("bin" "LICENSE" "config" "ignore")

# Loop through each folder and find its latest commit, then restore it
for folder in "${folders[@]}"
do
  # Get the latest commit where the folder still existed
  latest_commit=$(git rev-list -n 1 HEAD -- "$folder")

  # Check if we found a commit where the folder exists
  if [ -n "$latest_commit" ]; then
    echo "Restoring $folder from commit $latest_commit..."

    # Checkout the folder from the last commit where it existed
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

