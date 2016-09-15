class CreateHotelOverviews < ActiveRecord::Migration
  def change
    create_table :hotel_overviews do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
