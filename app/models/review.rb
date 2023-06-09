class Review < ApplicationRecord

  has_many :review_likes, dependent: :destroy
  belongs_to :user
  belongs_to :book

  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1}, presence: true

  validates :content, presence: true, length: { maximum: 1000 }

  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  scope :rate_count, -> {order(rate: :desc)}

  def review_liked_by?(user)
    review_likes.where(user_id: user).exists?
  end
end
