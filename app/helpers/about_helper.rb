module AboutHelper
  def photos_of_service(vi_service)
    if vi_service.photo_overviews.present?
      vi_service.photo_overviews.last.image.url(:large)
    else
      DEFAULT_PHOTO
    end
  end
end
