class Flat < ActiveRecord::Base
  belongs_to :user
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
end
