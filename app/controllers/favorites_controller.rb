class FavoritesController < ApplicationController

  before_action :require_user!, only: %i[index]

  def index
    render json: current_user.favorites
  end

  def create
  end

  def destroy
  end
end
