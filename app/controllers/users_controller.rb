class UsersController < ApplicationController
  def create
    user = User.create!(allowed_params)
    render json: user
  end

  def sign_in
    user = User.find_by(email: email, password: password)

    if user.present?
      # yay
    else
      # error
    end
  end

  private

  def allowed_params
    params.require(:user).permit(:email, :password)
  end
end
