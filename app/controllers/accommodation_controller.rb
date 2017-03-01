class AccommodationController < ApplicationController
  def index
    @room_types = RoomType.all
    @currency = Currency.last.currency
    @slogan = Slogan.last.content_slogan
  end

  def show
    @rooms = RoomType.where.not(friendly: params["friendly"]).order(:id)
    @room = RoomType.where(friendly: params["friendly"]).last
    @room_photos = @room.photo_of_rooms
    @currency = Currency.last.currency
  end
end
