class Admin::ReviewsController < ApplicationController

  def index
    @reviews = Review.all.order(created_at: :asc).page(params[:page]).per(9)
  end

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    def destroy
  		@review = Review.find(params[:id])
  		@review.destroy
  		redirect_to admin_reviews_path
	  end
  end
 private

  def book_params
    params.require(:book).permit(:title, :isbn, :author, :image_url, :item_url)
  end

  def review_params
    params.require(:review).permit(:user_id, :book_id, :content, :rate)
  end
end
