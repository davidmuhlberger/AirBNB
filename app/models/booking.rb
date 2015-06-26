class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :flat
  validates :guests, presence: true
  validates :check_in, presence: true
  validates :check_out, presence: true
  # validates :validatation_dates

  # def validatation_dates
  #   if check_out < check_in


  #   if check_in before Date.now
  #       error
  # end
end
