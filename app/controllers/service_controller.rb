class ServiceController < ApplicationController
  def show
    @service = HotelOverview.where(post_type: params[:title]).last
    @service_photos = @service.photo_overviews
    @vi_services = HotelOverview.where.not(post_type: HOTEL_OVERVIEW).where.not(post_type: params[:title])
  end

  def index
    @restaurant = HotelOverview.where(post_type: 'restaurant').last
    @photo_restaurants = @restaurant.photo_overviews
    @coffee = HotelOverview.where(post_type: 'bar-and-coffee').last
    @photo_coffees = @coffee.photo_overviews
    @spa = HotelOverview.where(post_type: 'spa-and-massage').last
    @photo_spas = @spa.photo_overviews
    @pool = HotelOverview.where(post_type: 'pool').last
    @photo_pools = @pool.photo_overviews
  end
end
