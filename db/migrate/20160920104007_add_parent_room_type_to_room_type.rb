class AddParentRoomTypeToRoomType < ActiveRecord::Migration
  def change
    add_reference(:room_types, :parent_room_type, foreign_key: true, index: true)
  end
end
