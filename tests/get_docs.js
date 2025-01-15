const fs = require('fs');

function getDocs() {
    const fileContent = fs.readFileSync('docs.jsonl', 'utf8');
    const docs = fileContent.trim().split('\n').map(line => JSON.parse(line));
    return docs;
}

module.exports = { getDocs };