class Post < ActiveRecord::Base
  belongs_to :user
	has_many :comments
	validates :title, presence: true, length: { minimum: 10, maximumu: 140 }
	validates :user_id, presence: true
end
