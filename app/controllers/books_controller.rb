class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save
      redirect_to books_path
    else
      @books = Book.all
      render 'index'
    end
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

    def book_params
      params.require(:book).permit(:title, :body)
    end
end
