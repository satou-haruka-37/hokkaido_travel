if Rails.application.credentials.open_weather
  class OpenWeather
    include HTTParty
    base_uri 'http://api.openweathermap.org/data/2.5'

    def self.current_weather_in_sapporo
      response = get("/weather?q=Sapporo,JP&appid=#{Rails.application.credentials.open_weather[:appid]}&units=metric&lang=ja")

      if response.success?
        { temp: response['main']['temp'], condition: response['weather'][0]['main'] }
      else
        { temp: nil, condition: nil }
      end
    end
  end
end
