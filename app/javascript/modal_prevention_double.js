// プロフィール設定モーダル（あとで設定するボタンがある）二重送信防止と送信中のアニメーション
document.addEventListener('DOMContentLoaded', function() {
  const modalSubmitButton = document.getElementById('modal-submit-button');

  modalSubmitButton.addEventListener('click', function(event) {
    modalSubmitButton.disabled = true;
    document.getElementById('setup-later').disabled = true;
    event.preventDefault(); // フォームのデフォルト送信をキャンセル
    modalSubmitButton.form.submit(); // フォームをプログラムから送信
    document.getElementById('loading').classList.remove('hidden');
  });
});