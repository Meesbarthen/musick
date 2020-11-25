class Instrument < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :bookings
  belongs_to :category

  validates :name, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :availability, inclusion: { in: [true, false] }
  validates :category, inclusion: { in: ["Keyboard family", "Strings family", "Drum family", "Woodwind family", "Percussion family"] }
end
