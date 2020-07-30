class Room < ApplicationRecord
  belongs_to :user

  has_many_attached :images

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :home_type, presence: true
  validates :room_type, presence: true
  validates :accomodates, presence: true
  validates :bedrooms, presence: true
  validates :bathrooms, presence: true
end
