if Rails.application.credentials.open_weather
  class OpenWeather
    include HTTParty
    base_uri 'http://api.openweathermap.org/data/2.5'

    def self.current_temperature_in_hokkaido
      response = get("/weather?q=Hokkaido,JP&appid=#{Rails.application.credentials.open_weather[:appid]}&units=metric")

      if response.success?
        response['main']['temp']
      else
        nil
      end
    end
  end
end
