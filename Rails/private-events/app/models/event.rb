class Event < ActiveRecord::Base
	scope :past_events, -> { where('day < ? ', Date.new + 5) }
  scope :upcoming_events, -> { where('day >= ? ', Date.new + 5) }

  belongs_to :creator, class_name: "User"
  # has_many :attendees, class_name: "User"
  has_many :event_relationships, foreign_key: "attended_event_id"
  has_many :attendees, through: :event_relationships, source: :attendee
  validates :description, presence: true

end