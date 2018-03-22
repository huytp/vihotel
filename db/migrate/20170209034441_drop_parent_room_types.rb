class DropParentRoomTypes < ActiveRecord::Migration
  def change
    drop_table :parent_room_types
  end
end
