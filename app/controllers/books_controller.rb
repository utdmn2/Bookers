class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end


  def create
  #データを新規登録するためのインスタンス作成
   book = Book.new(book_params)
  #データをデータベースに保存するためのsaveメソッド実行
   book.save
   #redirect先は詳細画面
   redirect_to book_path(book.id)
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

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end


end
