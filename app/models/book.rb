class Book < ApplicationRecord
   has_many :bookmarks, dependent: :destroy
   has_many :reviews, dependent: :destroy

   def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
   end

   def calculate_average_rate
    if reviews.present?
     (reviews.pluck(:rate).sum / reviews.count.to_f).round(1)
    else
     0.0
    end
   end
end
