class Flat < ActiveRecord::Base
  belongs_to :user
  has_many :bookings
  validates :title, presence: true
  validates :address_numberstreet, presence: true
  validates :address_zip, presence: true
  validates :address_city, presence: true
  validates :night_price, presence: true
  validates :capacity, presence: true

  has_attached_file :picture,
    styles: { medium: "300x300#", thumb: "150x150#" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  geocoded_by :full_address
  after_validation :geocode, if: ->(flat){
    flat.address_numberstreet.present? && flat.address_numberstreet_changed?
    flat.address_zip.present? && flat.address_zip_changed?
    flat.address_city.present? && flat.address_city_changed?
  }


  def full_address
    "#{address_numberstreet} #{address_zip} #{address_city}"
  end
end
