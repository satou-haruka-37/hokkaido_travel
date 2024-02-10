// 二重送信防止と送信中のアニメーション
document.addEventListener('DOMContentLoaded', function() {
  const submitButton = document.getElementById('submit-button');

  submitButton.addEventListener('click', function(event) {
    submitButton.disabled = true;
    event.preventDefault(); // フォームのデフォルト送信をキャンセル
    submitButton.form.submit(); // フォームをプログラムから送信
    document.getElementById('loading').classList.remove('hidden');
  });
});