# docs

The docs that [Cursor](https://cursor.com/) can see out-of-the-box.

<p align="center">
<a href="https://cursor.so/">
<img src="https://github-production-user-asset-6210df.s3.amazonaws.com/4297743/252120561-58028389-522b-4391-abd2-d159fb017519.png" width="700"><br>
</a>
</p>

### Contributing

Simply add a row to [`docs.jsonl`](docs.jsonl) and submit a PR. Please include the project's name, a url for our crawler to start at, and a prefix url that all crawleded urls should be children of.

### Development Setup

To enable local git hooks:
```bash
git config --local core.hooksPath .github/hooks
```
This will automatically check for duplicate URLs and names before each commit, remove any duplicate URL's. All duplicate Names and URL's will be reported to STDERR. The commit will still be accepted.

Once accepted, we'll crawl your documentation and make it available to all users of Cursor. Anyone will be able to reference the project with a simple '@ProjectName' command.

### What is this repo?

In Cursor, you can show GPT-4 project documentation to improve it's answers with @ commands like @Langchain and @Tokio. You can also spawn our crawler to add your own documentation by typing "@Add" in chat.

This repo is the list of documentation that's available for all users of Cursor with no "@Add" command required.

![Pre-commit Checks](https://github.com/getcursor/docs/actions/workflows/pre-commit.yml/badge.svg)
