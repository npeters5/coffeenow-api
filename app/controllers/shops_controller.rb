class ShopsController < ApplicationController
  def index
    latitude = params[:latitude]
    longitude = params[:longitude]
    shops = YelpApiWrapper.list_coffeeshops(latitude, longitude)
    render json: shops.as_json
  end

  def show
  end
end
