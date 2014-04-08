class User < ActiveRecord::Base
	has_many :posts
	has_many :comments
	validates :name, uniqueness: true, presence: true, 
					length: { minimum: 3, maximum: 15 }
end
