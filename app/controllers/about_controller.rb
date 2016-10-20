class AboutController < ApplicationController
  def index
    @service = HotelOverview.where(post_type: 'hotel-overview').last
    @photo_overviews = @service.photo_overviews
    @vi_services = HotelOverview.where.not(post_type: HOTEL_OVERVIEW)
  end
end
