# Cursor Built-In Documentation

This repository contains the official list of built-in documentation sources available in [Cursor](https://cursor.com/), the AI code editor.

<p align="center">
<a href="https://cursor.so/">
<img src="https://github-production-user-asset-6210df.s3.amazonaws.com/4297743/252120561-58028389-522b-4391-abd2-d159fb017519.png" width="700"><br>
</a>
</p>

## What is this?

When using Cursor, you can reference documentation for libraries, frameworks, and languages using the `@docs` functionality. For example, typing `@React` will provide context about React's documentation.

While you can add custom documentation sources to your local Cursor installation, this repository controls what documentation is available out-of-the-box for all users.

## Contributing

We welcome contributions to expand our built-in documentation! Here's how to add a new source:

1. Add a single new entry to [`docs.jsonl`](docs.jsonl) with:
   - Project name
   - Starting URL for our crawler
   - Prefix URL that all crawled pages should be under
2. Run `./scripts/reorder.sh` to sort the entries
3. Submit a PR with:
   - Only ONE new documentation source
   - A comment explaining what documentation you're adding and why
   - Confirmation that you've run the reorder script

**Note:** PRs with multiple documentation additions will be closed. Please submit separate PRs for each source.

Once approved, we'll crawl the documentation and make it available to all Cursor users via the `@ProjectName` command.
