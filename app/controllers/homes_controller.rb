class HomesController < ApplicationController
  def index
    @hotel_overview = HotelOverview.last
  end
end
