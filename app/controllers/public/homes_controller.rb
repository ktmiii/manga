class Public::HomesController < ApplicationController
  def top
    @reviews = Review.order(created_at: :desc).limit(5)
  end
end
