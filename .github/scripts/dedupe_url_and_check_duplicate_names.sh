/bin/bash

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
        print > "/dev/stderr"  # Duplicate URL line goes to STDERR.
    }

    # Count occurrences of field 4, using lower-case.
    if (++countField4[f4_lower] == 2)
        print "Duplicate in Name: " $4 > "/dev/stderr"
}' > tmpfile; mv tmpfile docs.jsonl