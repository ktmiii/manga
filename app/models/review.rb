class Review < ApplicationRecord
 
  has_many :review_comments, dependent: :destroy
  has_many :review_likes, dependent: :destroy
  belongs_to :user
  belongs_to :book
  
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1}, presence: true
    
  validates :content, presence: true, length: { maximum: 800 }
end
