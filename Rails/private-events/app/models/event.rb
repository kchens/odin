class Event < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  #validation doesn't work
  #validates :description, presence: true

end