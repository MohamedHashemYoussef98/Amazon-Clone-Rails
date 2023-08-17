class Api::V1::UserController < ApplicationController
  before_action :print_hi, only: [:login, :register]

  def login
    @user = User.find_by!(params.require(:user).permit(:email))
    if @user.valid_password?(params[:password])
      render json: { message: "Login Success" }
    end
  end

  def register
    begin
      @user = User.create! params.require(:user).permit(:email, :password)
    rescue
      render json: { message: "User not created" }, status: 503
    end
  end

  private

  def print_hi
    puts "HHHII"
  end
end
