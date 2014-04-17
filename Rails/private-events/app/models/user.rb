class User < ActiveRecord::Base
	has_many :events, foreign_key: "creator_id" #instead of user_id, need to set own index
	# has_many :attendees, through: :events, source: :attendees
	# validates :name, presence: true
	# validates :email, presence: true
	has_secure_password

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