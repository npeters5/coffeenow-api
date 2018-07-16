require 'httparty'
require 'pry'

class YelpApiWrapper
  URL = "https://api.yelp.com/v3/businesses/search?term=coffee"
  TOKEN = ENV["YELP_TOKEN"]

  def self.list_coffeeshops(lat, long)
    headers = {'Authorization' => "Bearer #{TOKEN}" }
    response = HTTParty.get("#{URL}&latitude=#{lat}&longitude=#{long}", headers: headers )
    shops_list = []
    if response["businesses"]
      response["businesses"].each do |business|
        shops_list << Shop.new(business["name"], business["id"], business["image_url"])
      end
    # else
    #   p response
    end
    shops_list
  end
end
