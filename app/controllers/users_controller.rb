class UsersController < ApplicationController
  def create
    user = User.new(allowed_params)
    if user.save
      render json: user
    else
      render json: { ok: false, errors: user.errors },
      status: :bad_request
    end
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
