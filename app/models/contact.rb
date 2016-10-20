class Contact < ActiveRecord::Base
  validates :full_name, presence: true
  validates :email, presence: true, format: { with: EMAIL_FORMAT, message: I18n.t("email_validator") }
  validates :phone, presence: true, length: {maximum: 15}
  validates :title, presence: true, length: {maximum: 50}
  validates :content, presence: true, length: {maximum: 500}
end
