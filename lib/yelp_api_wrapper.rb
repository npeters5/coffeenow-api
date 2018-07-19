require 'httparty'
require 'pry'

class YelpApiWrapper
  URL = "https://api.yelp.com/v3/businesses"
  TOKEN = ENV["YELP_TOKEN"]

  def self.list_coffeeshops(lat, long)
    headers = {'Authorization' => "Bearer #{TOKEN}" }
    response = HTTParty.get("#{URL}/search?term=coffee&latitude=#{lat}&longitude=#{long}", headers: headers )
    shops_list = []
    if response["businesses"]
      response["businesses"].each do |business|
        shops_list << Shop.new(business["name"], business["id"], business["image_url"], business["url"], business["rating"], business["coordinates"]["latitude"], business["coordinates"]["longitude"])
      end
    # else
    #   p response
    end
    shops_list
  end

  def self.get_shop_detail(shop_id)
    headers = {'Authorization' => "Bearer #{TOKEN}" }
    response = HTTParty.get("#{URL}/#{shop_id}", headers: headers )
    if response
      return response
    end
  end
end
