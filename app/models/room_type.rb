class RoomType < ActiveRecord::Base
  has_many :photo_of_rooms
  belongs_to :parent_room_type
end
