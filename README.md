# docs

The docs that Cursor's AI can see out-of-the-box.

### Contributing

Simply add a row to `docs.jsonl`. Please include the project's name, a url for our crawler to start at, and a prefix url that all crawleded urls be children of.

Adding a new doc will let Cursor users reference the project with a simple '@ProjectName' command.

### What is Cursor?

Cursor is a code editor designed for pair-programming with AI. In Cursor, you can chat with an AI that sees your entire codebase, edit code using GPT-4, and easily invoke an AI to fix your linter errors or stack-traces. Using Cursor is easy, it's a fork of VSCode, and you can import your extensions in one-click.

### What is this repo?

In Cursor, you can show GPT-4 project documentation to improve it's answers with @ commands like @Langchain and @Tokio. You can also spawn our crawler to add your own documention by typing "@Add" in chat.

This repo is the list of documentation that's available for all users of Cursor with no "@Add" required.
