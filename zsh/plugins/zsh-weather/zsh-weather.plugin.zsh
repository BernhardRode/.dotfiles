wttr() {
  local input="Abstatt"  # Default value for INPUT

  # If arguments are provided, merge them into one string
  if [ $# -gt 0 ]; then
    input="$*"
  fi

  # URL-encode the input
  local encoded_input=$(printf "%s" "$input" | jq -s -R -r @uri)

  # Perform the cURL request
  curl "https://wttr.in/$encoded_input"
}