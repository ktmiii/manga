class Book < ApplicationRecord
   has_many :favorite_books, dependent: :destroy
   has_many :reviews, dependent: :destroy
end
