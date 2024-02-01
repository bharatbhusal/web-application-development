const images = ["a.png", "c.png", "d.png", "e.png", "f.jpeg"]

function selectImage(image) {
    document.getElementById("large-view").innerHTML = `
        <img src="${image}" height="500" width="500px">
    `;
}

function leftScroll() {

    // Get the large-view element
    const largeView = document.getElementById("large-view");

    // Get the img element inside large-view
    const imgElement = largeView.querySelector("img");

    // Get the src attribute value
    const srcValue = imgElement.getAttribute("src");
    const currentImageIndex = images.indexOf(srcValue)

    const wrappedIndex = (currentImageIndex - 1 + images.length) % images.length;

    const image = images[wrappedIndex]
    document.getElementById("large-view").innerHTML = `
    <img src="${image}" height="500" width="500px">
`;

}

function rightScroll() {
    // Get the large-view element
    const largeView = document.getElementById("large-view");

    // Get the img element inside large-view
    const imgElement = largeView.querySelector("img");

    // Get the src attribute value
    const srcValue = imgElement.getAttribute("src");
    const currentImageIndex = images.indexOf(srcValue)

    const wrappedIndex = (currentImageIndex + 1 + images.length) % images.length;
    console.log(wrappedIndex)
    const image = images[wrappedIndex]
    document.getElementById("large-view").innerHTML = `
    <img src="${image}" height="500" width="500px">
`;

}