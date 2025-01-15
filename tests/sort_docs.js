const fs = require('fs');
const { getDocs } = require('./get_docs');

function sortDocs() {
    const docs = getDocs();
    
    // Sort the docs by name (case-insensitive)
    const sortedDocs = docs.sort((a, b) => 
        a.name.toLowerCase().localeCompare(b.name.toLowerCase())
    );
    
    // Write back to docs.jsonl
    const output = sortedDocs.map(doc => JSON.stringify(doc)).join('\n') + '\n';
    fs.writeFileSync('docs.jsonl', output);
    
    console.log("✅ docs.jsonl has been sorted by name");
}

// Run the sort
sortDocs(); 