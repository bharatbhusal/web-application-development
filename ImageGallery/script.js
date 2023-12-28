function selectImage(image) {
    document.getElementById("large-view").innerHTML = `
        <img src="${image}" height="500" width="500px">
    `;
}
