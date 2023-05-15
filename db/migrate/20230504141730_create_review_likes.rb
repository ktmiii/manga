class CreateReviewLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :review_likes do |t|

      t.references :user, foreign_key: true, null: false
      t.references :review, foreign_key: true, null: false
      t.timestamps
    end
  end
end
