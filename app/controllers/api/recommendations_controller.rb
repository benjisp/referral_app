class Api::RecommendationsController < ApplicationController


  def index
    @recommendations = Recommendation.all
    render 'index.json.jb'
    
  end
  def create
    @recommendation = Recommendation.new(
      feature_id: params[:feature_id],
      sender_id: params[:sender_id],
      recipient_id: params[:recipient_id]
    )
    if @recommendation.save
      render 'show.json.jb'
    else
      render json: {errors: @recommendation.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @recommendation = Recommendation.find(params[:id])
    render 'show.json.jb'
  end

  def destroy
    @recommendation = Recommendation.find(params[:id])
    @recommendation.destroy
    render json: {message: "Removed from list."}
  end
end
