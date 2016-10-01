class CreateReversations < ActiveRecord::Migration
  def change
    create_table :reversations do |t|
      t.string :full_name
      t.string :phone
      t.string :email
      t.string :company
      t.string :address
      t.timestamp :check_in
      t.timestamp :check_out
      t.string :room_type
      t.integer :number_of_room
      t.integer :number_adult
      t.integer :number_children
      t.text :requirement

      t.timestamps null: false
    end
  end
end
