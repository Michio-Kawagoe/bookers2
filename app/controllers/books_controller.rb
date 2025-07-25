class BooksController < ApplicationController
  def new
    @Book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @user = current_user
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      error_message = if @book.errors.count == 1
        "1 error prohibited this book from being saved:"
      else
        "#{ @book.errors.count } errors prohibited this book from being saved:"
      end
      flash.now[:alert] = error_message
      @books = Book.all
      render :index
    end
  end

  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def show
    # @book = current_user.books.find(params[:id])
    @book = Book.find(params[:id])
    @user = @book.user

    if current_user == @user
      @editable = true
    else
      @editable = false
    end
  end

  def edit
    @book = Book.find(params[:id])
    if current_user != @book.user
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if current_user != @book.user
      redirect_to books_path
    end

    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      error_message = if @book.errors.count == 1
      "#{ @book.errors.count } errors prohibited this book from being saved:"
    end
    flash.now[:alert] = error_message
    render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
    flash[:notice] = "Book was successfully destroyed"
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
