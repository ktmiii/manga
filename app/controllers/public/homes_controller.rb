class Public::HomesController < ApplicationController
  def top
    @reviews = Review.includes(:user).order(created_at: :desc).limit(5)
    @bookRates = Book.joins(:reviews).group(:id).order("avg(reviews.rate) desc").limit(5)
    @bookReviews = Book.joins(:reviews).group(:id).order("count(reviews.book_id) desc").limit(5)
  end
end
