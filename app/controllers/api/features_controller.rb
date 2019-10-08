class Api::FeaturesController < ApplicationController


  def index
    @features = HTTP.get("http://www.omdbapi.com/?apikey=#{ENV['api_key']}&s=#{params[:search]}").parse
    render 'index.json.jb'
  end

  def show
    @features = HTTP.get("http://www.omdbapi.com/?apikey=#{ENV['api_key']}&i=#{params[:id]}").parse
    render 'index.json.jb'
  end
end
