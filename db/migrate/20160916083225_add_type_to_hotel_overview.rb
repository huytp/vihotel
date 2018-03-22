class AddTypeToHotelOverview < ActiveRecord::Migration
  def change
    add_column :hotel_overviews, :post_type, :string
  end
end
