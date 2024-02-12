// 投稿の画像プレビュー表示
document.addEventListener('DOMContentLoaded', function() {
  let postImagesInput = document.getElementById('post-images-input');

  postImagesInput.addEventListener('change', function(event) {
    let previewImages = document.getElementById('preview-post-images');
    previewImages.innerHTML = '';

    let files = event.target.files;

    for (let i = 0; i < files.length; i++) {
      let file = files[i];
      let reader = new FileReader();

      reader.onload = function(e) {
        let img = document.createElement('img');
        img.src = e.target.result;
        img.classList.add("w-1/3", "h-auto", "object-contain", "m-2");
        previewImages.appendChild(img);
      }

      reader.readAsDataURL(file);
    }
  });
});