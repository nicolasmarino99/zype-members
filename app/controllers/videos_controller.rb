require 'json'
class VideosController < ApplicationController
  def index
    @response = JSON.parse(ZypeAPI::Videos.show_all.body)["response"]
  end

  def show
    @id, @premium = params[:id].split(',')
    session[:video_id] = @id
    session[:premium] = @premium
  end

  private
end
