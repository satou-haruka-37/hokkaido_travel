document.addEventListener("DOMContentLoaded", function () {
  setTimeout(function () {
    let currentIndex = 0;
    let numberOfImages = 5;
    const imageElements = document.querySelectorAll(".top-images");
    function crossDissolve() {
      currentIndex = (currentIndex + 1) % numberOfImages;
      const nextImageElement = imageElements[currentIndex];
      const currentImageElement = imageElements[currentIndex === 0 ? numberOfImages - 1 : currentIndex - 1];
      currentImageElement.classList.remove("opacity-1");
      currentImageElement.classList.add("opacity-0");
      nextImageElement.classList.remove("opacity-0");
      nextImageElement.classList.add("opacity-1");
      setTimeout(crossDissolve, 8000);
    }

    crossDissolve();
  }, 3000);
});