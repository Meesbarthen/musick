class Booking < ApplicationRecord
  belongs_to :instrument
  belongs_to :user

  validates :begin_date, presence: true
  validates :end_date, presence: true
  validates :price, presence: true

end
