// 確認ダイアログ
document.addEventListener('DOMContentLoaded', function() {
  const deleteButton = document.getElementById("delete-button");
  deleteButton.addEventListener("click", function(event) {
    if(!window.confirm('本当に削除しますか？')){
      window.alert('削除がキャンセルされました');
      event.preventDefault();
    }
  });
});