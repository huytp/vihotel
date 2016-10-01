class HomesController < ApplicationController
  def index
    @hotel_overview = HotelOverview.where(post_type: 'hotel-overview').last
    @photo_overviews = @hotel_overview.photo_overviews
    @restaurant = HotelOverview.where(post_type: 'restaurant').last
    @photo_restaurants = @restaurant.photo_overviews
    @coffee = HotelOverview.where(post_type: 'bar-and-coffee').last
    @photo_coffees = @coffee.photo_overviews
    @spa = HotelOverview.where(post_type: 'spa-and-massage').last
    @photo_spas = @spa.photo_overviews
    @pool = HotelOverview.where(post_type: 'pool').last
    @photo_pools = @pool.photo_overviews
    @premier_collections = ParentRoomType.where(name: "Premier Collection").last.room_types
    @smart_collections = ParentRoomType.where(name: "Smart Superior Collection").last.room_types
    @deluxe_collections = ParentRoomType.where(name: "Deluxe Collection").last.room_types
  end
end
