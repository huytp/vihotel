class AddRoomCountToRoomType < ActiveRecord::Migration
  def change
    add_column :room_types, :room_count, :integer
  end
end
