module WeatherHelper
  # 天気の大まかな分類
  FAIR_CONDITIONS = %w[Clear Clouds].freeze
  INCLEMENT_CONDITIONS = %w[Rain Drizzle Thunderstorm Snow Squall Tornado Mist Haze Fog].freeze
  OTHERS_CONDITIONS = %w[Smoke Dust Sand Ash].freeze

  # 天気アイコン
  CONDITION_TO_ICON = {
    'Clear' => 'weather_icon01.webp',
    'Clouds' => 'weather_icon02.webp',
    'Rain' => 'weather_icon03.webp',
    'Drizzle' => 'weather_icon04.webp',
    'Thunderstorm' => 'weather_icon05.webp',
    'Snow' => 'weather_icon06.webp',
    'Squall' => 'weather_icon07.webp',
    'Tornado' => 'weather_icon08.webp',
    'Mist' => 'weather_icon09.webp',
    'Haze' => 'weather_icon09.webp',
    'Fog' => 'weather_icon09.webp',
    'Smoke' => 'weather_icon10.webp',
    'Dust' => 'weather_icon11.webp',
    'Sand' => 'weather_icon11.webp',
    'Ash' => 'weather_icon11.webp'
  }.freeze

  def weather_icon(condition)
    CONDITION_TO_ICON[condition]
  end
end
