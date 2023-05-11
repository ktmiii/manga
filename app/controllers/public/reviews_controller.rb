class Public::ReviewsController < ApplicationController

  def index
  end

  def new
    @book = Book.find_by(isbn: params.dig(:book, :isbn))
    unless @book
      @book = Book.new(book_params)
    end
    @review = Review.new
    @confirm = false
  end

  def confirm
    #bookが存在したらそれをとってきて無かったらパラメータから作る
    @book = Book.find_by(isbn: params.dig(:book, :isbn))
    unless @book
      @book = Book.new(book_params)
    end
    @review = current_user.reviews.build(review_params)
    @review.book_id = @book.id
    render :new if @review.invalid?
  end

  def create
    @book = Book.find_by(isbn: params.dig(:book, :isbn))
    unless @book
      @book = Book.create!(book_params)
    end
      if current_user.reviews.exists?(book_id: @book.id)
        flash[:alert] = "既にレビューを投稿しています。"
        redirect_to @book
      else
        #ユーザーidを入れたままレビューを作成
        @review = current_user.reviews.build(review_params)
        @review.book_id = @book.id
        if params[:confirm_button] # 「入力内容を確認する」ボタンが押された場合
          @confirm = true
          render :new if @review.invalid?
        elsif @review.save
          flash[:notice] = "success"
          redirect_to @review
        else
          flash[:alert] = "エラーが発生しました。"
          render :new
        end
      end
  end

  def complete
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
