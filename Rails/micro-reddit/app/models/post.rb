class Post < ActiveRecord::Base
	
	validates :comments, length: { minimum: 20, maximum: 30 }
	belongs_to :user, foreign_key: "user_id"
end
