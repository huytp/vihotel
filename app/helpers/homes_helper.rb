module HomesHelper
  def photos_of_collection collection
    collection.photo_of_rooms.last.image.url(:large)
  end
end
