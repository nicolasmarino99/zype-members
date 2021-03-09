require 'json'
class VideosController < ApplicationController
  def index
    @response = JSON.parse(ZypeAPI::Videos.show_all.body)["response"]
  end
end
