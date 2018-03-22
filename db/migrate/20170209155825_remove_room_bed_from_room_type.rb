class RemoveRoomBedFromRoomType < ActiveRecord::Migration
  def change
    remove_column :room_types, :room_bed
  end
end
