class Public::ReviewsController < ApplicationController

  def index
  end

  def new
    #bookが存在したらそれをとってきて無かったらパラメータから作る
    @book = Book.find_by(isbn: params.dig(:book, :isbn))
    unless @book
      @book = Book.new(book_params)
    end
    @review = Review.new
  end

  def create
    @book = Book.find_by(isbn: params.dig(:book, :isbn))
    unless @book
      @book = Book.create!(book_params)
    end
    #ユーザーidを入れたままレビューを作成
    @review = current_user.reviews.build(review_params)
    @review.book_id = @book.id
    if @review.save
      flash[:notice] = "success"
      redirect_to @review
    else
      flash.now[:alert] = "failed"
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
    @book = @review.book
  end

  def edit
  end

  def update
  end

  def destroy
  end



  private

  def book_params
    params.require(:book).permit(:title, :isbn, :author, :image_url, :item_url)
  end

  def review_params
    params.require(:review).permit(:user_id, :book_id, :content, :rate)
  end
end
