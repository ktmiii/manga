class Public::ReviewLikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @review = Review.find(params[:review_id])
    review_like = @review.review_likes.new(user_id: current_user.id)
    if review_like.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @review = Review.find(params[:review_id])
    review_like = @review.review_likes.find_by(user_id: current_user.id)
    if review_like.present?
      review_like.destroy
      redirect_to request.referer
    else
        redirect_to request.referer
    end
  end
end
