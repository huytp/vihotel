class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data, styles: {thumb: "200x200>", large: "700x700>"}
  validates_attachment :data, content_type: {content_type: ["image/jpeg", "image/jpg", "image/png", "image/gif"]}
  def url_content
    url(:large)
  end
end
