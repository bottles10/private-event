class Event < ApplicationRecord
  belongs_to :creator, foreign_key: "user_id", class_name: :User

  has_many :attendances
  has_many :attendees, through: :attendances,  source: :user

  validates :title, presence: true, length: { minimum: 2 }
  validates :location, presence: true, length: { minimum: 2 }
  validates :description, presence: true, length: { minimum: 10 } 
  validates :date, presence: true
  scope :past, -> { where(date: ..(Time.now)) }
  scope :incoming,-> { where(date: (Time.now)..) }

  def formatted_date
    date.strftime("%B %d, %Y %I:%M %p")
  end

end
