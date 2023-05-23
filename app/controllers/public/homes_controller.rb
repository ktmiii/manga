class Public::HomesController < ApplicationController
  def top
    @reviews = Review.includes(:user).order(created_at: :desc).limit(5)
  end
end
