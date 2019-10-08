class Api::UsersController < ApplicationController
  

  def create
    @user = User.new(
      username: params[:username],
      email: params[:email],
      password_digest: params[:password_digest]
    )
    if @user.save
      render 'show.json.jb'
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
    
    @user.username = params[:username] || @user.username
    @user.email = params[:email] || @user.email
    @user.password_digest = params[:password_digest] || @user.password_digest
    if @user.save
      render 'show.json.jb'
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: {message: "Account deleted."}
  end
end
