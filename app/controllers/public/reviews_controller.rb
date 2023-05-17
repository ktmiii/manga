class Public::ReviewsController < ApplicationController
  :authenticate_user!, only: [:new]

  def index
    #reviewを持った本のデータを重複しないように持ってくる
    @books = Book.joins(:reviews).distinct.page(params[:page]).per(10)
  end

  def new
    @book = Book.find_by(isbn: params.dig(:book, :isbn))
    if @book.nil?
      @book = Book.new(book_params)
    elsif current_user.reviews.exists?(book_id: @book.id)
      flash[:alert] = "既にレビューを投稿しています。"
      redirect_to book_path(@book.id, {book: {isbn: @book.isbn}}) and return
    end
    if session[:content].present? && session[:rate].present?
       @review = Review.new(content: session[:content], rate: session[:rate])
    else
       @review = Review.new
    end
    @confirm = false
  end

  def confirm
    #bookが存在したらそれをとってきて無かったらパラメータから作る
    @book = Book.find_by(isbn: params.dig(:book, :isbn))
    unless @book
      @book = Book.new(book_params)
    end
    @review = current_user.reviews.build(review_params)
    render :new if @review.content.blank? || @review.rate.blank?
    session[:content] = @review.content
    session[:rate] = @review.rate
  end

  def create
    @book = Book.find_by(isbn: params.dig(:book, :isbn))
    unless @book
      @book = Book.new(book_params)
      @book.save # Bookオブジェクトを新規作成して保存する
    end
        #ユーザーidを入れたままレビューを作成
      @review = current_user.reviews.build(review_params)
      @review.book_id = @book.id
      if params[:confirm_button] # 「入力内容を確認する」ボタンが押された場合
        @confirm = true
        render :new if @review.invalid?
      elsif @review.save
        flash[:notice] = "success"
        redirect_to reviews_complete_path
      else
        flash[:alert] = "エラーが発生しました。"
        render :new
      end
    session.delete(:content)
    session.delete(:rate)
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

