const { getDocs } = require('./get_docs');

function testDocsSort() {
    const docs = getDocs();
    
    const currentNames = docs.map(doc => doc.name);
    
    const sortedNames = [...currentNames].sort((a, b) => 
        a.toLowerCase().localeCompare(b.toLowerCase())
    );
    
    const isEqual = currentNames.every((name, i) => name === sortedNames[i]);
    
    if (!isEqual) {
        console.log("❌ docs.jsonl is not sorted by name");
        console.log("\nFirst few sorting issues found:");
        
        // Print first 3 mismatches for easier debugging
        const mismatches = currentNames
            .map((name, i) => ({ index: i, current: name, expected: sortedNames[i] }))
            .filter(({ current, expected }) => current !== expected)
            .slice(0, 3);

        mismatches.forEach(({ index, current, expected }) => {
            console.log(`Position ${index}:`);
            console.log(`  Current:  ${current}`);
            console.log(`  Expected: ${expected}`);
        });
        return false;
    }
    
    console.log("✅ docs.jsonl is properly sorted by name");
    return true;
}

// Run the test
testDocsSort(); 