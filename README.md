# docs

The docs that [Cursor](https://cursor.com/) can see out-of-the-box.

<p align="center">
<a href="https://cursor.so/">
<img src="https://github-production-user-asset-6210df.s3.amazonaws.com/4297743/252120561-58028389-522b-4391-abd2-d159fb017519.png" width="700"><br>
</a>
</p>

### Contributing

Simply add a row to [`docs.jsonl`](docs.jsonl) and submit a PR. Please include the project's name, a url for our crawler to start at, and a prefix url that all crawleded urls should be children of.

**Please only submit one document in a PR, batched additions will be closed regardless of the contents**

Once accepted, we'll crawl your documentation and make it available to all users of Cursor. Anyone will be able to reference the project with a simple '@ProjectName' command.

### What is this repo?

Within the Cursor IDE, you can provide additional context about the libraries, languages, and frameworks you are using, using the @docs functionality. 

While you can freely add any documentation you like into your own installation, this repo controls the list of build-in docs that are available out the box. 
