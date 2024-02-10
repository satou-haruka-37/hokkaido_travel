// マイページをわかりやすく開いておく(ページネーション時以外)
document.addEventListener('DOMContentLoaded', function () {
  const currentURL = window.location.href;

  if (!currentURL.includes('?')) {
    const checkbox = document.getElementById('mypage-menu');
    checkbox.checked = true;
  }
});