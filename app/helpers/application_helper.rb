module ApplicationHelper

  def notif_requests
    sum = 0
    current_user.flats.each do |flat|
      sum += flat.bookings.select { |b| b.status == "Pending" }.size
    end
    sum
  end

  def notif_bookings
    bookings = current_user.bookings.select { |b| b.status == "Pending" }.size
  end

  def notifications
    bookings = notif_bookings
    requests = notif_requests
    bookings + requests
  end

end
