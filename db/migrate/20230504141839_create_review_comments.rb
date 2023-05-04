class CreateReviewComments < ActiveRecord::Migration[6.1]
  def change
    create_table :review_comments do |t|

      t.integer :user_id, null: false
      t.integer :review_id, null: false
      t.text :comment, null: false
      t.timestamps
    end
  end
end
