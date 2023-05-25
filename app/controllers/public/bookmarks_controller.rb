class Public::BookmarksController < ApplicationController
   before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @book = Book.find(params[:book_id])
    bookmark = @book.bookmarks.new(user_id: current_user.id)
    bookmark.save
  end

  def destroy
    @book = Book.find(params[:book_id])
    bookmark = @book.bookmarks.find_by(user_id: current_user.id)
    bookmark.destroy
  end
end
