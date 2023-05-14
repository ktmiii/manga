class Book < ApplicationRecord
   has_many :bookmarks, dependent: :destroy
   has_many :reviews, dependent: :destroy

   def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
   end
end
