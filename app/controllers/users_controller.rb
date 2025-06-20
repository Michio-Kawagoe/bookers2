class UsersController < ApplicationController
  def new
    @book = Book.new
  end


  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @books = Book.joins(:user) 
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
