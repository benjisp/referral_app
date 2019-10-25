class Api::FeaturesController < ApplicationController

  before_action :authenticate_user

  def index
    @features = HTTP.get("http://www.omdbapi.com/?apikey=#{ENV['api_key']}&s=#{params[:search]}").parse["Search"]
    render 'index.json.jb'
  end

  def show
    @feature = Feature.find(params[:id])
    render 'show.json.jb'
  end
end
