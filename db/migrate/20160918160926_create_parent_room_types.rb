class CreateParentRoomTypes < ActiveRecord::Migration
  def change
    create_table :parent_room_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
