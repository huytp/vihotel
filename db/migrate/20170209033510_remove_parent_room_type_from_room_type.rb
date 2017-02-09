class RemoveParentRoomTypeFromRoomType < ActiveRecord::Migration
  def change
    remove_reference :room_types, :parent_room_type, index: true
  end
end
