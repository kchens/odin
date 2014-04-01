class User < ActiveRecord::Base
	validates :username, length: { minimum: 10 }
	has_many :posts, foreign_key: 'posts_id'
end
