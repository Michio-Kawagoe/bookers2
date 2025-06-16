class BooksController < ApplicationController
  def new
    @Book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def index
    @user = current_user
    @books = current_user.books
    @book = Book.new
  end

  def show
    @user = current_user
    @book = current_user.books.find(params[:id])
  end

  def edit
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
