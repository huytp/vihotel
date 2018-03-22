module AccommodationHelper
  def get_room_type
    RoomType.all.collect{|roomtype| roomtype.room_type_name}
  end
  def photos_of_room(room)
    if room.photo_of_rooms.present?
      room.photo_of_rooms.last.image.url(:large)
    else
      DEFAULT_PHOTO
    end
  end
end
