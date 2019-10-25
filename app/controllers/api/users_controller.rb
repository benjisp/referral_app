class Api::UsersController < ApplicationController

  before_action :authenticate_user, only: [:show]

  def create
    @user = User.new(
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_digest: params[:password_digest]
    )
    if @user.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @user = User.find(params[:id])

    if current_user == @user
      @user.username = params[:username] || @user.username
      @user.email = params[:email] || @user.email
      @user.password = params[:password] || @user.password_digest
      if @user.save
        render 'show.json.jb'
      else
        render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {message: "Wrong user."}
    end
  end

  def destroy
    @user = User.find(params[:id])

    if current_user == @user
      @user.destroy
      render json: {message: "Account deleted."}
    else
      render json: {message: "Wrong user."}
    end
  end
end