class User < ApplicationRecord
  has_many :events, class_name: "Event"
  has_many :user_registrations, class_name: "Registration"
  has_many :bookings
  has_many :events, through: :bookings
  validates :email, uniqueness: true
  validates :password, confirmation: true, presence: true, length: { minimum: 8 }, unless: Proc.new { password.nil? }
  validates :password_confirmation, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
