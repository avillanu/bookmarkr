class CreateBookmarkModel < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :title
      t.string :url
      t.text :description
      t.integer :user_id
      t.integer :category_id
      t.timestamps :created_at
      t.timestamps :updated_at
    end
  end
end
