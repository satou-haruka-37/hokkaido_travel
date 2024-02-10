// アバター画像のプレビュー
document.addEventListener('DOMContentLoaded', function() {
  let avatarInput = document.getElementById('avatar-input');

  avatarInput.addEventListener('change', function(event) {
    let previewAvatar = document.getElementById('preview-avatar');
    previewAvatar.innerHTML = '';

    let file = event.target.files[0];
    let reader = new FileReader();

    reader.onload = function(e) {
      let img = new Image();
      img.src = e.target.result;

      // 正方形にリサイズ
      img.onload = function() {
        let canvas = document.createElement('canvas');
        let context = canvas.getContext('2d');

        let size = Math.min(img.width, img.height);
        canvas.width = size;
        canvas.height = size;

        let offsetX = (img.width - size) / 2;
        let offsetY = (img.height - size) / 2;
        context.drawImage(img, offsetX, offsetY, size, size, 0, 0, size, size);

        // 以降、他画像プレビューと同様
        let imgElement = new Image();
        imgElement.src = canvas.toDataURL('image/png');
        imgElement.classList.add("w-32", "h-auto", "rounded-full");
        previewAvatar.appendChild(imgElement);
      };
    };

    reader.readAsDataURL(file);
  });
});