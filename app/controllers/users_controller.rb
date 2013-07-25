class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.create(params[:user])

    @user = login_user(params[:user][:username], params[:user][:password])

    redirect_to user_url(@user)
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @secret = Secret.new
  end
end
