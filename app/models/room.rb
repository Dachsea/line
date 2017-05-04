class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users
  has_many :message_rooms
  has_many :message, through: :message_rooms
  
  accepts_nested_attributes_for :room_users, allow_destroy: true
end
