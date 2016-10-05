class AccommodationController < ApplicationController
  def index
    @premier_collections = ParentRoomType.where(name: "Premier Collection").last.room_types
    @smart_collections = ParentRoomType.where(name: "Smart Superior Collection").last.room_types
    @deluxe_collections = ParentRoomType.where(name: "Deluxe Collection").last.room_types
    @currency = Currency.last.currency
    @slogan = eval(Slogan.last.content)[I18n.locale]
  end

  def show
    @room = RoomType.where(friendly: params["friendly"]).last
    @room_photos = @room.photo_of_rooms
  end
end
