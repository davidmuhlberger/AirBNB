class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_flat, only: [:new, :create]
  before_action :find_booking, only: [:edit, :cancel, :update, :confirm, :reject]

  def index
    @bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = @flat.bookings.build(booking_params)
    @booking.user = current_user
    @booking.status = "Pending"
    if @booking.save
      redirect_to booking_path(@booking)
      BookingMailer.new_booking_traveler(current_user, @flat, @booking).deliver_now
      BookingMailer.new_request_owner(current_user, @flat, @booking).deliver_now
    else
      render :new
    end
  end

  def edit

  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def cancel
    @booking.status = "Cancelled"
    @booking.save
    redirect_to booking_path(@booking)
  end

  def destroy

  end

  private

  def booking_params
    params.require(:booking).permit(:guests, :check_in, :check_out, :message, :status)
  end

  def find_flat
    @flat = Flat.find(params[:flat_id])
  end

  def find_booking
    @booking = current_user.bookings.find(params[:id])
  end

end
