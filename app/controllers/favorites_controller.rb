class FavoritesController < ApplicationController
  before_action :require_user!

  def index
    render json: current_user.favorites
  end

  def create
    fav = Favorite.new(fav_params.merge(user_id: current_user.id))

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

  def fav_params
    params.require(:favorite).permit(:shop_id)
  end
end
