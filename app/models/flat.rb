class Flat < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :address_numberstreet, presence: true
  validates :address_zip, presence: true
  validates :address_city, presence: true
  validates :address_state, presence: true
  validates :address_country, presence: true
  validates :night_price, presence: true
  validates :capacity, presence: true
end
