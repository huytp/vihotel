module AboutHelper
  def photos_of_service(vi_service)
    vi_service.photo_overviews.last.image.url(:large)
  end
end
