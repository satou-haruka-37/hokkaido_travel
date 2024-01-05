module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    screens: {
      'sm': '440px', //ビューでsm:クラスとすると440以上でsm:クラスを適応。元のクラスをスマホ用にしておく
      'md': '734px', //微妙な横幅のブラウザ、タブレットサイズ以上
      'lg': '1000px', //pcサイズ以上
    },
    extend: {
      fontFamily: {
        main: ['Zen Maru Gothic', 'serif'],
      }
    },
  },
	plugins: [require("daisyui")],

  daisyui: {
    themes: ["winter"],
  },
}
