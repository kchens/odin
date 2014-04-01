class User < ActiveRecord::Base
	validates :username, presence: true, length: { minimum: 6, maximum: 40}
	has_many :posts
end
