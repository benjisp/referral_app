class Api::RecommendationsController < ApplicationController

  before_action :authenticate_user

  def index
    @recommendations = current_user.recommendations
    render 'index.json.jb'
  end

  def create #check if feature is in database
    @feature = Feature.find_by(imdb_id: params[:imdbID])
    if !@feature 
      response = HTTP.get("http://www.omdbapi.com/?apikey=#{ENV['api_key']}&i=#{params[:imdbID]}").parse
      @feature = Feature.create(
        imdb_id: response["imdbID"],
        title: response["Title"],
        year: response["Year"],
        genre: response["Genre"],
        director: response["Director"],
        plot: response["Plot"],
        poster: response["Poster"]
        )
    end
    @recommendation = Recommendation.new(
      feature_id: @feature.id,
      sender_id: current_user.id,
      recipient_id: params[:recipient_id]
    )
    if @recommendation.save
      render 'show.json.jb'
    else
      render json: {errors: @recommendation.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @recommendation = Recommendation.find(params[:id])
    @recommendation.destroy
    render json: {message: "Removed from list."}
  end
end
