class User < ApplicationRecord
  has_many :events, class_name: "Event"
  has_many :user_registrations, class_name: "Registration"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
end
