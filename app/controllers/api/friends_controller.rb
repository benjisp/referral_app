class Api::FriendsController < ApplicationController

  before_action :authenticate_user

  def index
    @friends = current_user.friends
    render 'index.json.jb'
  end

  def create
    @friend = Friend.new(
      user1_id: current_user.id,
      user2_id: params[:user2_id],
      pending: true
    )
    if @friend.save
      render 'show.json.jb'
    else
      render json: {errors: @friend.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @friend = Friend.find(params[:id])
    render 'show.json.jb'
  end

  def destroy
    @friend = Friend.find(params[:id])
    @friend.destroy
    render json: { message: "Removed friend." }
  end
end
