class ReservationsController < ApplicationController
  before_action :set_reservation, only: :show
  before_action :authenticate_user!, only: [:show, :admin_index]
  before_action :check_authorization, only: [:show, :admin_index]
  def index
    @reservation = Reservation.new
  end

  def admin_index
    @reservations = Reservation.all
  end

  def create
    @reservation = Reservation.new(reservation_params)

    respond_to do |format|
      if @reservation.save
        UserMailer.delay.reservation(@reservation)
        UserMailer.delay.reservation_rep(@reservation, I18n.locale)
        format.html { redirect_to accommodation_index_path, notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  private
    def check_authorization
      unless current_user.staff? || current_user.admin?
        redirect_to error_errors_path
      end
    end
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    def reservation_params
      params.require(:reservation).permit(:full_name, :phone, :email, :company, :address, :check_in, :check_out, :room_type, :number_of_room, :number_adult, :number_children, :requirement)
    end
end
