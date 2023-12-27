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
    },
  },
	plugins: [require("daisyui")],

  daisyui: {
    themes: ["winter"],
  },
}
