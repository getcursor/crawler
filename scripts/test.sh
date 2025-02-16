#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Extract URLs and test each one
while read -r line; do
  # Extract URL and line number
  url=$(echo "$line" | cut -d: -f2- | sed -E 's/.*"crawlerStart": "([^"]+)".*/\1/')
  line_num=$(echo "$line" | cut -d: -f1)
  
  # Get HTTP status code and redirect location for URL
  response=$(curl -s -L -o /dev/null -w "%{http_code} %{url_effective}" "$url")
  status=$(echo "$response" | cut -d' ' -f1)
  redirect_url=$(echo "$response" | cut -d' ' -f2-)
  
  # Check if status code indicates success (2xx), redirect (3xx), or failure
  if [[ $status =~ ^2 ]]; then
    echo -e "\033[32m✓ $url ($status)\033[0m"
  elif [[ $status =~ ^3 ]]; then
    echo -e "\033[33m→ $url redirects to $redirect_url ($status)\033[0m"
    # Update docs.jsonl with redirect destination
    sed -i '' "${line_num}s|\"crawlerStart\": \"$url\"|\"crawlerStart\": \"$redirect_url\"|" "$SCRIPT_DIR/../docs.jsonl"
  elif [[ $status == "404" ]]; then
    echo -e "\033[31m✗ $url (404 - removing from docs.jsonl)\033[0m"
    # Get the start and end line numbers for the JSON object
    start_line=$((line_num - 1))
    end_line=$((line_num + 2))
    # Delete the JSON object from docs.jsonl
    sed -i '' "${start_line},${end_line}d" "$SCRIPT_DIR/../docs.jsonl"
  else
    echo -e "\033[31m✗ $url ($status)\033[0m"
  fi
done < <(grep -n "crawlerStart" "$SCRIPT_DIR/../docs.jsonl")
