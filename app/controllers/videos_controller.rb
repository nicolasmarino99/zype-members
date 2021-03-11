require 'json'
class VideosController < ApplicationController
  def index
    @response = JSON.parse(ZypeAPI::Videos.show_all)["response"]
    p JSON.parse(ZypeAPI::Videos.show_all)
  end

  def show
    @id, @premium = params[:id].split(',')
    session[:video_id] = @id
    session[:premium] = @premium
  end

  private
end
