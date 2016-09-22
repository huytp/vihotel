class CreateRoomTypes < ActiveRecord::Migration
  def change
    create_table :room_types do |t|
      t.string :room_type_name
      t.text :description
      t.string :room_size
      t.string :room_bed
      t.string :room_view
      t.string :room_features

      t.timestamps null: false
    end
  end
end
