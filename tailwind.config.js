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
      'xl': '1300px', //pcブラウザでも横幅が広い時
    },
    extend: {
      fontFamily: {
        main: ['Zen Maru Gothic', 'serif'],
      },
    },
  },
	plugins: [require("daisyui")],

  daisyui: {
    themes: ["cupcake"],
  },
  daisyui: {
    themes: [
      {
        mytheme: {
          "base-content": "#3a302c",
          "neutral": "#dcd6d1",
          "base-100": "#fef6f7",
          "base-200": '#fbe4e6',
          "info": "#e7cceb",
          "success": "#bad576",
          "warning": "#f3ddc4",
          "error": "#eca2a5",
        },
      },
    ],
  },
}
