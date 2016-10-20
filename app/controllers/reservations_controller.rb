class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :check]
  before_action :authenticate_user!, only: [:show, :admin_index]
  before_action :check_authorization, only: [:show, :admin_index]
  def index
    @reservation = Reservation.new
  end

  def admin_index
    @reservations = Reservation.order(created_at: :DESC).page(params[:page])
  end

  def create
    @reservation = Reservation.new(reservation_params)

    respond_to do |format|
      if @reservation.save
        UserMailer.reservation(@reservation).deliver_now
        UserMailer.reservation_rep(@reservation, I18n.locale).deliver_now
        format.html { redirect_to accommodation_index_path, notice: I18n.t("reservation_successfully") }
      end
    end
  end

  def show
  end

  def check
    if @reservation.check
      @reservation.check = false
    else
      @reservation.check = true
    end
    if @reservation.save
      flash[:notice] = I18n.t("update")
    else
      flash[:notice] = I18n.t("error")
    end
    redirect_to @reservation
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
