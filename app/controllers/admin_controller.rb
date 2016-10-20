class AdminController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource class: :Admin
  def index
    @reservations = Reservation.order(created_at: :DESC).first(5)
    @contacts = Contact.order(created_at: :DESC).first(5)
  end
end
