// ユーザー削除時のアラート
document.addEventListener('DOMContentLoaded', function() {
  const deleteUser = document.getElementById("delete-user");
  deleteUser.addEventListener("click", function(event) {
    const firstConfirmation = window.confirm('本当に退会しますか？');
    const secondConfirmation = firstConfirmation && window.confirm('本当に本当に退会しますか？\n（このボタンを押すとアカウントが削除され元に戻せません）\n※投稿は「退会したユーザー」の投稿として残ります');

    if (!secondConfirmation) {
      window.alert('退会がキャンセルされました');
      event.preventDefault();
    }
  });
});