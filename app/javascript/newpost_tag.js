// タグの選択をチェックボックスではなく色を変えて表すためのコード
  document.addEventListener('DOMContentLoaded', function() {
    const buttons = document.querySelectorAll('[data-behavior="tag-button"]');

    buttons.forEach(function(button) {
      // PC用
      button.addEventListener('click', function(event) {
        event.preventDefault();
        const checkbox = this.parentNode.querySelector('[data-behavior="tag-checkbox"]');
        checkbox.checked = !checkbox.checked;

        if (checkbox.checked) {
          this.classList.add('bg-success', 'text-white');
        } else {
          this.classList.remove('bg-success', 'text-white');
        }
      });

      // スマートフォン用
      button.addEventListener('touchstart', function(event) {
        event.preventDefault();
        const checkbox = this.parentNode.querySelector('[data-behavior="tag-checkbox"]');
        checkbox.checked = !checkbox.checked;

        if (checkbox.checked) {
          this.classList.add('bg-success', 'text-white');
        } else {
          this.classList.remove('bg-success', 'text-white');
        }
      });
    });
  });