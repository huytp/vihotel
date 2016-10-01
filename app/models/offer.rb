class Offer < ActiveRecord::Base
  has_attached_file :image, styles: {small: "400x400>", large: "900x900>"}
  validates_attachment :image, presence: true, content_type: {content_type: ["image/jpeg","image","image/png"]}
end
