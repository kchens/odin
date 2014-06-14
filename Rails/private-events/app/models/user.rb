class User < ActiveRecord::Base
	# scope :previous, -> { joins(:event_relationships).where(
 #  'attended_events.day < ? ', Date.new + 5) 
 #  }
	has_many :events, foreign_key: "creator_id" #instead of user_id, need to set own index

	has_many :event_relationships, foreign_key: "attendee_id"
	has_many :attended_events, through: :event_relationships, source: :attended_event
	has_secure_password




	# SELECT attended_events FROM User (Left Outer) 
	# JOIN Event
	# ON User.id = attendee_id
	# Where ('day < ? ', Date.new + 5)

 #  scope :upcoming, -> { where(attended_events:('day >= ? ', Date.new + 5) ) }

	# has_many :attended_events, foreign_key: "attendee_id",
	# 							class_name: "Event"
	# has_many :attendees, through: :events								
    # has_many :creators, through: :attended_events
	
	# validates :name, presence: true
	# validates :email, presence: true
	# has_secure_password


	def previous
    attended_events.where('day < ? ', Date.new + 5)
  end

  def upcoming
    attended_events.where('day >= ? ', Date.new + 5)
  end

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.hash(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private

		def create_remember_token
			self.remember_token = User.hash(User.new_remember_token)
		end

end