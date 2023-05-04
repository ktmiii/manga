class CreateReviewLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :review_likes do |t|

      t.integer :user_id, null: false
      t.integer :review_id, null: false
      t.timestamps
    end
  end
end
