class Event < ApplicationRecord
  belongs_to :creator, foreign_key: "user_id", class_name: :User

  has_many :attendances
  has_many :attendees, through: :attendances,  source: :user
end
