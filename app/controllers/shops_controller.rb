class ShopsController < ApplicationController
  def index
    shops = YelpApiWrapper.list_coffeeshops
    render json: shops.as_json
  end

  def show
  end
end
