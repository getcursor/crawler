# Cursor Built-In Documentation

This repository contains the official list of built-in documentation sources available in [Cursor](https://cursor.com/), the AI code editor.

<p align="center">
<a href="https://cursor.so/">
<img src="https://github-production-user-asset-6210df.s3.amazonaws.com/4297743/252120561-58028389-522b-4391-abd2-d159fb017519.png" width="700"><br>
</a>
</p>

## What is this?

When using Cursor, you can reference documentation for libraries, frameworks, and languages using the `@docs` functionality. For example, typing `@React` will provide context about React's documentation. 

Learn more about using @docs, and how to add your own documentation sources in Cursor at our [documentation](https://docs.cursor.com/context/@-symbols/@-docs).

Documentation is automatically updated in the editor every week, on Sunday.

While you can add custom documentation sources to your local Cursor installation, this repository controls what documentation is available out-of-the-box for all users.

## What Qualifies for Built-in Docs?

We aim to include documentation for tools and technologies that are:

1. **Widely Used**: Technologies with significant adoption in the developer community (e.g. React, Python, AWS services)
2. **Well-Documented**: Sources must have comprehensive, maintained documentation with a stable URL structure
3. **Developer-Focused**: Tools and frameworks used directly by developers in their workflow
4. **Production-Ready**: No beta/alpha versions or experimental tools
5. **English Language**: Documentation must be primarily in English
6. **Latest Versions**: Only the most recent stable version of libraries will be included, with rare exceptions for widely-used legacy versions (e.g. Python 2)

Some examples that would NOT qualify:
- Personal project documentation
- Company-specific internal tools
- Outdated or unmaintained projects
- Documentation that requires authentication
- Unofficial documentation sources

## Contributing

We welcome contributions to expand our built-in documentation or fix issues with existing sources! 

To add a new documentation source:

1. Add a single new entry to [`docs.jsonl`](docs.jsonl) with:
   - Project name
   - Starting URL for our crawler
   - Prefix URL that all crawled pages should be under
2. Run `./scripts/reorder.sh` to sort the entries
3. Submit a PR with:
   - Only ONE new documentation source (for additions)
   - A comment explaining what you're adding/fixing and why
   - Confirmation that you've run the reorder script

**Note:** When adding new sources, PRs with multiple documentation additions will be closed. Please submit separate PRs for each new source. PRs fixing existing documentation sources can include multiple fixes.

Once approved, we'll crawl the documentation and make it available to all Cursor users via the `@ProjectName` command.
