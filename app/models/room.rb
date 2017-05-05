class Room < ApplicationRecord
  has_many :room_users, foreign_key: 'room_id'
  has_many :users, through: :room_users
  has_many :messages
  
  accepts_nested_attributes_for :room_users, allow_destroy: true
  accepts_nested_attributes_for :messages, allow_destroy: true
end
