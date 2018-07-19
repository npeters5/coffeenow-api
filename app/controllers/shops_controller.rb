class ShopsController < ApplicationController
  def index
    latitude = params[:latitude]
    longitude = params[:longitude]
    shops = YelpApiWrapper.list_coffeeshops(latitude, longitude)
    render json: shops.as_json
  end

  def show
    shop_id = params[:id]
    shop = YelpApiWrapper.get_shop_detail(shop_id)
    render json: shop.as_json
  end
end
