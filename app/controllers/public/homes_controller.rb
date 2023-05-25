class Public::HomesController < ApplicationController
  def top
    @reviews = Review.includes(:user).order(created_at: :desc).limit(5)
    @bookRates = Book.all.sort_by { |book| book.calculate_average_rate }.reverse.take(5)
    @bookReviews = Book.all.sort_by { |book| book.reviews.count }.reverse.take(5)
  end
end
