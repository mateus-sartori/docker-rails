class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if User.exists?(email: @user.email)
      render json: { message: 'Usuário já existe' }, status: :conflict
    else
      @user.save
    end
  end

  private

  def user_params
    params.permit(:email, :name, :password)
  end
end
