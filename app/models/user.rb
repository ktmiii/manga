class User < ApplicationRecord

  has_many :favorite_books
  has_many :books, through: :favorite_books, source: :book
  has_many :reviews, dependent: :destroy
  has_many :review_comments, dependent: :destroy
  has_many :review_likes, dependent: :destroy

  def favorite_books(book)
    self.favorites.find_or_create_by(book_id: book.id)
  end

  def unfavorite_books(book)
    favorite = self.favorites.find_by(book_id: book.id)
    favorite.destroy if favorite
  end

  has_one_attached :profile_image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :user_name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 10 }



end
