class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect to rentals_path
    else
      'new'
    end
  end

  private
  def user_params
     params.require(:user).permit(:email, :password, :password_confirmation, :remember_me, :username)
  end
end
