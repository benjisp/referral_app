class Api::FriendsController < ApplicationController


  def index
    @friends = Friend.all
    render 'index.json.jb'
  end

  def create
    @recommendation = Recommendation.new(
      user1_id: params[:user1_id],
      user2_id: params[:user2_id],
      pending: false
    )
    if @recommendation.save
      render 'show.json.jb'
    else
      render json: {errors: @recommendation.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @friend = Friend.find(params[:id])
    render 'show.json.jb'
  end

  def destroy
    @friend = Friend.find(params[:id])
    @friend.destroy
    render json: { message: "Removed friend." }
  end
end
