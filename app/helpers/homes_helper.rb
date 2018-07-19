module HomesHelper
  def photos_of_collection collection, width
    if collection.photo_of_rooms.present?
      width > 890 ? collection.photo_of_rooms.last.image.url(:large) : collection.photo_of_rooms.last.image.url(:small)
    else
      DEFAULT_PHOTO
    end
  end
end
