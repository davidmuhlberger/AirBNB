module Users
  class BookingsController < ApplicationController

    before_action :authenticate_user!
    before_action :find_requests

    def reject
      @booking = Booking.find(params[:id])
      @booking.status = "Rejected"
      @booking.save
      @flat = @booking.flat
      redirect_to users_bookings_path
    end

    def confirm
      @booking = Booking.find(params[:id])
      @booking.status = "Confirmed"
      @booking.save
      redirect_to users_bookings_path
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
      @requests.sort_by! {|request| -(request.updated_at).to_f}
    end

  end
end
