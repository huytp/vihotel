class AddHotelOverviewToPhotoOverview < ActiveRecord::Migration
  def change
    add_reference(:photo_overviews, :hotel_overview, foreign_key: true, index: true)
  end
end
