class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|

      t.string :isbn, null: false
      t.string :title, null: false
      t.string :author, null: false
      t.string :image_url
      t.string :item_url, null: false
      t.timestamps
    end
  end
end
