class CreatePhotoOverviews < ActiveRecord::Migration
  def change
    create_table :photo_overviews do |t|
      t.attachment :image

      t.timestamps null: false
    end
  end
end
