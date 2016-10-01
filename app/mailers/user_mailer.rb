class UserMailer < ApplicationMailer

  def welcome_email contact
    @contact = contact
    mail( from: ENV["default_form_mailer"], to: ENV["default_form_mailer"], subject: contact.title)
  end
  def reservation reservation
    @reservation = reservation
    mail( from: ENV["default_form_mailer"], to: ENV["default_form_mailer"], subject: "Thông tin đặt phòng")
  end

  def reservation_rep reservation
    @reservation = reservation
    mail(from: "VIHOTEL<#{ENV['default_form_mailer']}>", to: reservation.email, subject: "Confirm booking")
  end
end
