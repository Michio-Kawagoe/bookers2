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
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to user_path(current_user)
    end

    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(params[:id])
    else
      error_message = if @user.errors.count == 1
        "1 error prohibited this obj from being saved:"
      else
        "#{ @user.errors.count } errors prohibited this book from being saved:"
      end
      flash.now[:alert] = error_message
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end
