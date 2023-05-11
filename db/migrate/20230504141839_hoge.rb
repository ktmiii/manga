class DeleteHoge < ActiveRecord::Migration[6.1]
  def change
      drop_table :hoge
  end
end