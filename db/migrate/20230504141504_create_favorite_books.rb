class CreateFavoriteBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_books do |t|

      t.integer :user_id, null: false
      t.integer :book_id, null: false
      t.timestamps
    end
  end
end
