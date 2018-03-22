class CreateRoomFeatures < ActiveRecord::Migration
  def change
    create_table :room_features do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
