class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates :note, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  validates :post_id, presence: true
end
