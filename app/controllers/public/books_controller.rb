class Public::BooksController < ApplicationController

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
          book.save
        end
        #戻り値を設定することで最後の行がbook.item_urlじゃなくなる
        book
      end
      @books = Kaminari.paginate_array(@books).page(params[:page]).per(10)
    else
      @books = Kaminari.paginate_array([]).page(params[:page]).per(10)
    end
  end

  def show
    #idが0だったらパラメータの情報を入れて、あったら探して持ってくる
    if params[:id] == "0"
      @book = Book.new(book_params)
    else
      @book = Book.find(params[:id])
    end
    @reviews = @book.reviews
  end

  private

  def book_params
    params.require(:book).permit(:title, :isbn, :author, :image_url, :item_url)
  end
end
