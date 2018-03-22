class AddRoomTypeIdToPhotoOfRoom < ActiveRecord::Migration
  def change
    add_reference(:photo_of_rooms, :room_type, foreign_key: true, index: true)
  end
end
