class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      session[:access_token] = JSON.parse(ZypeAPI::Videos.authenticate(@user.username, 'password'))["access_token"]
      redirect_to session[:video_id].nil? ? "/" : "/videos/#{session[:video_id]},#{session[:premium]}"
    else
        redirect_to '/login'
    end
  end

  def destroy
    session.clear
    redirect_to '/login'
  end

end
