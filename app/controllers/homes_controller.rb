class HomesController < ApplicationController
  def index
    @hotel_overview = HotelOverview.where(post_type: 'hotel-overview').last
    @photo_overviews = @hotel_overview.photo_overviews
    @restaurant = HotelOverview.where(post_type: 'restaurant').last
    if @restaurant.present?
      @photo_restaurants = @restaurant.photo_overviews
    end
    @coffee = HotelOverview.where(post_type: 'bar-and-coffee').last
    if @coffee.present?
      @photo_coffees = @coffee.photo_overviews
    end
    @spa = HotelOverview.where(post_type: 'spa-and-massage').last
    if @spa.present?
      @photo_spas = @spa.photo_overviews
    end
    @pool = HotelOverview.where(post_type: 'pool').last
    if @pool.present?
      @photo_pools = @pool.photo_overviews
    end
    @premier_collections = ParentRoomType.where(name: "Premier Collection").last.room_types
    @smart_collections = ParentRoomType.where(name: "Smart Superior Collection").last.room_types
    @deluxe_collections = ParentRoomType.where(name: "Deluxe Collection").last.room_types
    @currency = Currency.last.currency
    @slogan = eval(Slogan.last.content)[I18n.locale]
  end
end
