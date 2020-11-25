class Instrument < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  belongs_to :category
  has_many :bookings
  belongs_to :category

  validates :name, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :availability, inclusion: { in: [true, false] }
end
