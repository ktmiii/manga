class Public::BooksController < ApplicationController

  def show
    
    @book = Book.find_by(isbn: params.dig(:book, :isbn))
    unless @book
      @book = Book.new(book_params)
    end
      @review = @book.review
    else
      
    end
  end

  def index
    #楽天ブックスからデータを取得してくる
    #presentは空文字とnillをfalseにする
    if params[:search].present?
      result = RakutenWebService::Books::Book.search(bookGenreId: "001001", title: params[:search])
    else
      result = []
    end
    #データがあったらそのまま表示
    if result.any?
      @books = result.map do |data|
        book = Book.find_or_initialize_by(isbn: data.isbn)
        #データが無かったら新しくモデルに収納する
        if book.new_record?
          book.title = data.title
          book.author = data.author
          #gsubは置き換え（第一引数の文字を第二引数に置き換える）
          book.image_url = data.medium_image_url.gsub('?_ex=120x120', '')
          book.item_url = data.item_url
        end
        #戻り値を設定することで最後の行がbook.item_urlじゃなくなる
        book
      end
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :isbn, :author, :image_url, :item_url)
  end
end
