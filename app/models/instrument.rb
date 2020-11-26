class Instrument < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  belongs_to :category
  has_many :bookings
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :availability, inclusion: { in: [true, false] }

  include PgSearch::Model
    pg_search_scope :global_search,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
