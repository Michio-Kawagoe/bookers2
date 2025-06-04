class BooksController < ApplicationController
  def new
    @Book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to users_path(params[:id])
  end

  def index
  end

  def show
  end

  def edit
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
