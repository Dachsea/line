class Message < ApplicationRecord
  has_many :message_rooms
  has_many :rooms, through: :message_rooms
end
