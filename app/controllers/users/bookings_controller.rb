module Users
  class BookingsController < ApplicationController

    before_action :authenticate_user!
    before_action :find_requests

    def change_status_to_rejected
      @booking.status = "Rejected"
      @booking.save
      redirect_to booking_path(@booking)
    end

    def change_status_to_confirmed
      @booking.status = "Confirmed"
      @booking.save
      redirect_to booking_path(@booking)
    end

    def index
    end

    private

    def find_requests
      @requests = []
      current_user.flats.each do |flat|
        flat.bookings.each do |booking|
          @requests << booking
        end
      end
    end

  end
end
