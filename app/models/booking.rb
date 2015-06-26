class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :flat
  validates :guests, presence: true
  validates :check_in, presence: true
  validates :check_out, presence: true
end
