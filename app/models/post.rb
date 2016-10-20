class Post < ActiveRecord::Base
  has_attached_file :image, styles: {small: "200x2000>", large: "700x2000>"}
  validates_attachment :image, presence: true, content_type: {content_type: ["image/jpeg","image/png"]}
end
