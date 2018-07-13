require 'httparty'
require 'pry'

class YelpApiWrapper
  URL = "https://api.yelp.com/v3/businesses/search?"
  TOKEN = ENV["YELP_TOKEN"]

  def self.list_coffeeshops
    headers = {'Authorization' => "Bearer #{TOKEN}" }
    response = HTTParty.get("#{URL}term=coffee&latitude=47.587407&longitude=-122.316075", headers: headers )
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
