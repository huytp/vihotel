class AddCostToRoomType < ActiveRecord::Migration
  def change
    add_column :room_types, :cost, :integer
  end
end
