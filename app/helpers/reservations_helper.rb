module ReservationsHelper
  def get_room_type
    RoomType.all.collect{|roomtype| roomtype.room_type_name}
  end
end
