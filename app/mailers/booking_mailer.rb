class BookingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.new_booking.subject
  #
  def new_booking_traveler(user, flat, booking)
    @user = user
    @flat = flat
    @booking = booking
    mail(to: @user.email, subject: 'Your booking request for #{@flat.title} has been sent to the owner')
  end

  def new_request_owner(user, flat, booking)
    @user = user
    @flat = flat
    @booking = booking
    mail(to: @flat.user.email, subject: 'Your have a new booking request for #{@flat.title}')
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.cancel_booking.subject
  #
  def cancel_booking
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.reject_booking.subject
  #
  def reject_booking
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.confirm_booking.subject
  #
  def confirm_booking
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
