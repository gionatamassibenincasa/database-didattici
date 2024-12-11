const horizontalLineRegex = /^[| -]+$/;

function iterateRows(lines, options) {
    const { leftBound, rightBound } = options;
    let rows = [];

    for (const line of lines) {
        const trimmedLine = line.trim();
        if (horizontalLineRegex.test(trimmedLine)) continue;

        const row = trimmedLine.split('|').map(x => x.trim());

        if (row.shift() !== '') {
            throw new SyntaxError('Inconsistent left bound');
        }

        if (row.pop() !== '') {
            throw new SyntaxError('Inconsistent right bound');
        }

        rows.push(row);
    }
    return rows;
}

function createMarkdownArrayTable(text) {
    const lines = [...text.split('\n')].map(s => s.trim());
    const name = lines[0].split('|')[1].trim();
    lines.shift();

    if (lines[0] === '') lines.shift();
    if (lines[lines.length - 1] === '') lines.pop();

    if (lines.length === 0) {
        throw new SyntaxError('Text is empty');
    }

    const headers = lines[0].split('|').map(x => x.trim());
    const leftBound = headers[0] === '';
    const rightBound = headers[headers.length - 1] === '';
    if (leftBound) headers.shift();
    if (rightBound) headers.pop();

    const rows = iterateRows(lines.slice(1), { leftBound, rightBound });

    return { name, headers, rows };
}

function createHTMLTable(text) {
    // Creating elements instead of code should improve the efficiency
    const { name, headers, rows } = createMarkdownArrayTable(text);
    let h = `<table style="float: center; margin-left: auto; margin-right: auto; border-collapse: collapse;"><caption style="color: darkred">${name}</caption><thead style="color: blue;"><tr>`;
    headers.forEach(attr => { h += `<th style="border: 1px solid blue; padding: 1ex">${attr}</th>` });
    h += `</tr></thead><tbody style="color: darkgreen">`;
    rows.forEach(r => {
        h += `<tr>`
        r.forEach(d => h += `<td style="border: 1px solid darkgreen; padding: 1ex">${d}</td>`);
        h += `</tr>`;
    });
    h += `</tbody></table>`;

    return h;
}
function addHTMLTable(text) {

    const h = createHTMLTable(text);
    return `HTML: ` +  `<div style="margin-left: auto; margin-right: auto; width: 100%;">${h}</div>`;
}

console.log("Hello from relations.js");