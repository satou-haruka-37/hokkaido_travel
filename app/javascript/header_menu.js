// メニューが開いている時、画面内のどこかを押すとメニューを自動的に閉じる
document.addEventListener('DOMContentLoaded', function() {
  var menuDetails = document.querySelector('details');

  // 画面内のどこかをクリックした時のイベントリスナー
  document.addEventListener('click', function(event) {
    // クリックされた要素がメニュー自体またはその中に含まれている場合は何もしない
    if (event.target === menuDetails || menuDetails.contains(event.target)) {
      return;
    }

    // メニューが開いている場合は閉じる
    if (menuDetails.open) {
      menuDetails.open = false;
    }
  });
});