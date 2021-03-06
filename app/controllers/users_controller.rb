class UsersController < ApplicationController
  def create
    puts "inside users create"
    user = User.new(allowed_params)
    puts "inside users create after User.new"
    if User.exists?(email: allowed_params["email"])
      render json: { ok: false, errors: "User already exists" },
      status: :bad_request
      puts "inside users create, where user already exists"
    elsif user.save
      render json: user
    else
      render json: { ok: false, errors: user.errors },
      status: :bad_request
      puts "inside users create, where user already exists"
    end
  end

  def sign_in
    user = User.find_by(email: allowed_params["email"])
    if user.present?
      if user.password == allowed_params["password"]
        render json: user
      else
        render json: { ok: false, errors: "Password incorrect" },
        status: :unauthorized
      end
    else
      render json: { ok: false, errors: "Please sign up" },
      status: :bad_request
    end
  end

  private

  def allowed_params
    params.require(:user).permit(:email, :password)
  end
end
