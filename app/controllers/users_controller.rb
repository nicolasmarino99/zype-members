class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:username, :password))
    session[:user_id] = @user.id
    session[:access_token] = JSON.parse(ZypeAPI::Videos.authenticate(@user.username, @user.password))["access_token"]
    redirect_to '/welcome'
  end
end
