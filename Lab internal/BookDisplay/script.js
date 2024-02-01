// script.js
async function loadXMLDoc(filename) {
    try
    {
        const response = await fetch(filename);
        const str = await response.text();
        return (new window.DOMParser()).parseFromString(str, "text/xml");
    } catch (err)
    {
        console.log('Error while loading XML:', err);
        return null;
    }
}
function transformXML() {
    loadXMLDoc("books.xml")
        .then(xmlDoc => {
            if (xmlDoc)
            {
                const books = xmlDoc.getElementsByTagName("book");
                const table = document.createElement("table");
                const headerRow = document.createElement("tr");
                ["Title", "Author", "Genre", "Year"].forEach(title => {
                    const th = document.createElement("th");
                    th.textContent = title;
                    headerRow.appendChild(th);
                });
                table.appendChild(headerRow);
                for (let i = 0; i < books.length; i++)
                {
                    const book = books[i];
                    const tr = document.createElement("tr");
                    ["title", "author", "genre", "year"].forEach(prop => {
                        const td = document.createElement("td");
                        td.textContent = book.getElementsByTagName(prop)[0].textContent;
                        tr.appendChild(td);
                    });
                    table.appendChild(tr);
                }

                document.getElementById("table-container").appendChild(table);
            }
        });
}

