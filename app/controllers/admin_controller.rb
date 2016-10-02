class AdminController < ApplicationController
  def index
    @reservations = Reservation.order(created_at: :DESC).first(5)
    @contacts = Contact.order(created_at: :DESC).first(5)
  end
end
