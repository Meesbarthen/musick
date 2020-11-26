class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :instruments
  has_many :bookings
  has_many :bookings_as_owner, through: :instruments, source: :bookings

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def full_name
    first_name + ' ' + last_name
  end
end
