class CreatePhotoOfRooms < ActiveRecord::Migration
  def change
    create_table :photo_of_rooms do |t|
      t.attachment :image

      t.timestamps null: false
    end
  end
end
