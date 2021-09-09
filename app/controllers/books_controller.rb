class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new(book_params)
  end


  def create
  #データを新規登録するためのインスタンス作成
   book = Book.new(book_params)
  #データをデータベースに保存するためのsaveメソッド実行
   book.save
   #redirect先はどこにするか
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
