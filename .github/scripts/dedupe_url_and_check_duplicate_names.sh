#!/bin/bash

# Store original file hash
original_hash=$(md5sum docs.jsonl)

sort -f -t'"' -k4 docs.jsonl | \
awk -F'"' '{
    # Normalize the case of the URL and the Name
    url = tolower($8)
    name = tolower($4)

    # Deduplicate based on URL (field 8) as before.
    if (!(url in seenUrl)) {
        seenUrl[url] = 1
        print
    } else {
        print "Removed URL:    " $0  > "/dev/stderr"  # Duplicate URL line goes to STDERR.
    }

    # Count occurrences of field 4, using lower-case.
    if (++count_name[name] == 2)
        print "Duplicate Name: " $0 > "/dev/stderr"
}' > tmpfile

mv tmpfile docs.jsonl

# Check if file was modified
new_hash=$(md5sum docs.jsonl)
if [ "$original_hash" != "$new_hash" ]; then
    git add docs.jsonl
fi