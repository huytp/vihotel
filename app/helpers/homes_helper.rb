module HomesHelper
  def photos_of_collection collection
    if collection.photo_of_rooms.present?
      collection.photo_of_rooms.last.image.url(:large)
    else
      DEFAULT_PHOTO
    end
  end
end
