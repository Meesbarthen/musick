class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :instruments
  has_many :bookings
  has_many :bookings_as_owner, through: :instruments, source: :bookings
  validates_presence_of :first_name, :last_name

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def full_name
    if first_name && last_name
      first_name + ' ' + last_name
    else
      "undenfind"
    end
  end
end
