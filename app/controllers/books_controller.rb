class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end


  def create
   @book = Book.new(book_params)
   if @book.save
     redirect_to book_path(@book.id)
   else
     render :index
   end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id]) #データ(レコード)を一件取得
    book.destroy  #データ（レコード）を削除
    redirect_to books_path #投稿一覧画面へリダイレクト

  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end


end
