module DirectionsHelper
  def google_maps_directions_url(destination)
    "https://www.google.com/maps/dir/?api=1&origin=現在地&destination=#{destination}"
  end
end
