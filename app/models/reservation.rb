class Reservation < ActiveRecord::Base
  validates :full_name, presence: true
  validates :phone, presence: true, length: {maximum: 15}
  validates :email, presence: true, format: { with: EMAIL_FORMAT, message: I18n.t("email_validator") }
  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :room_type, presence: true
  validates :number_of_room, presence: true, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 10}
  validates :number_adult, presence: true, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 100}
  validates :number_children, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100}, allow_nil: true
  validates :requirement, length: {maximum: 1000}
  validates :company, length: {maximum: 100}
  validates :address, length: {maximum: 200}
end
