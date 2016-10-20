class ParentRoomType < ActiveRecord::Base
  has_many :room_types
end
