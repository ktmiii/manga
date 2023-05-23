class Public::ReviewLikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @review = Review.find(params[:review_id])
    review_like = @review.review_likes.new(user_id: current_user.id)
    review_like.save
  end

  def destroy
    @review = Review.find(params[:review_id])
    review_like = @review.review_likes.find_by(user_id: current_user.id)
    review_like.destroy
  end
end
