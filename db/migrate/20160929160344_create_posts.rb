class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.attachment :image
      t.string :post_type

      t.timestamps null: false
    end
  end
end
