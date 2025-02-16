#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Sort JSON entries by name, remove duplicates, ensure one item per line
jq -c '.' "$SCRIPT_DIR/../docs.jsonl" | \
  jq -s 'sort_by(.name) | unique_by(.name) | .[]' | \
  tr -d '\n' | sed 's/}{/}\n{/g' > "$SCRIPT_DIR/../docs.jsonl.tmp"

mv "$SCRIPT_DIR/../docs.jsonl.tmp" "$SCRIPT_DIR/../docs.jsonl"

# Count items after sorting
TOTAL=$(wc -l < "$SCRIPT_DIR/../docs.jsonl" | tr -d ' ')

echo -e "\n\033[32m✓ Successfully reordered $TOTAL items\033[0m\n"