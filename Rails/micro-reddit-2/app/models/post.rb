class Post < ActiveRecord::Base
  belongs_to :user
  validates :comment, presence: true, length: { minimum: 5, maximum: 30 }
end
