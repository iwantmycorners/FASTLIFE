
require "uri"
require "net/http"

class PagesController < ApplicationController
  def home
    url = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=48.87%2C2.38&radius=1000&type=restaurant&key=")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    @response = https.request(request)

    @hash = JSON.parse(@response.body)
  end
end
