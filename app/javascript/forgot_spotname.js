// スポット名が思い出せない方の検索フォーム
document.addEventListener('DOMContentLoaded', function () {
  const searchButton = document.getElementById('search-btn')

  searchButton.addEventListener('click', function(event) {
    let query = document.getElementById('search-query').value.trim(); // trim()で前後の空白を除去
    if (query === '') {
      alert('キーワードを入力してから検索ボタンを押してください');
      event.preventDefault(); // デフォルトのイベントをキャンセルしてURLに遷移しないようにする
    } else {
      let url = 'https://www.google.com/search?q=' + encodeURIComponent(query);
      window.open(url, '_blank');
    }
  });
});