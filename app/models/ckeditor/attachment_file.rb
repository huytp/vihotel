class Ckeditor::AttachmentFile < Ckeditor::Asset
  has_attached_file :data
  validates_attachment :data, content_type: {content_type: ["application/pdf","application/vnd.ms-excel",
             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
             "application/msword",
             "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
             "text/plain"]}


  def url_thumb
    @url_thumb ||= Ckeditor::Utils.filethumb(filename)
  end
end
