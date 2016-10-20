class AddFriendlyToRoomType < ActiveRecord::Migration
  def change
    add_column :room_types, :friendly, :string
  end
end
