class Room < ApplicationRecord
  belongs_to :user

  has_many :guest_reviews
  has_many_attached :images
  has_many :reservations

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :home_type, presence: true
  validates :room_type, presence: true
  validates :accomodates, presence: true
  validates :bedrooms, presence: true
  validates :bathrooms, presence: true

  def average_rating 
    guest_reviews.count == 0 ? 0 : guest_reviews.average(:rating).round(2).to_i
  end
end
