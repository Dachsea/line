class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users
  has_many :message_rooms
  has_many :message, through: :message_rooms
end
