class ShopsController < ApplicationController
  before_action :require_user!, only: [:index, :show]

  def index
    latitude = params[:latitude]
    longitude = params[:longitude]
    shops = YelpApiWrapper.list_coffeeshops(latitude, longitude)
    shops.each do |shop|
      # is this working?
      # for your initial load of [..., ..., ...]
      shop.favorited! if current_user.favorited?(shop)
    end
    render json: shops.as_json
  end

  def show
    shop_id = params[:id]
    shop = YelpApiWrapper.get_shop_detail(shop_id)
    shop.favorited! if current_user.favorited?(shop)
    render json: shop.as_json
  end
end
