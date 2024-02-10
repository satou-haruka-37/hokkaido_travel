document.addEventListener('DOMContentLoaded', function() {
  // bodyの文字数カウント
  const textArea = document.querySelector('textarea[name="post[body]"]');
  const charCount = document.getElementById('charCount');

  textArea.addEventListener('input', function() {
    const maxLength = 300;
    const currentLength = textArea.value.length;

    if (currentLength <= maxLength) {
      const remaining = maxLength - currentLength;
      charCount.textContent = `${remaining}文字まで`;
    } else {
      charCount.textContent = '文字数オーバーです';
    }
  });
});