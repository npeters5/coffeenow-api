class FavoritesController < ApplicationController

  before_action :require_user!, only: %i[index]

  def index
    render json: current_user.favorites
  end

  def create
    user = find_current_user_from_request_header
    fav = Favorite.new(shop_id: params[:shop_id], user_id: user.id)
    if fav.save
      render json: fav
    else
      render json: { ok: false, errors: fav.errors },
      status: :bad_request
    end
  end

  def destroy
  end

  private

  def find_current_user_from_request_header
    User.find_by(api_token: api_token)
  end

  def api_token
    request.headers['X-Api-Token']
  end

  def fav_params
    params.require(:favorite).permit(:shop_id, :user_id)
  end
end
