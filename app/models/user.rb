class User < ApplicationRecord
  has_many :events
 
  has_many :attendances 
  has_many :attended_events, through: :attendances, source: :event

  validates :username, presence: true, length: { minimum: 2 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
