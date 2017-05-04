class User < ApplicationRecord
  has_many :room_users
  has_many :rooms, through: :room_users

  has_secure_password
  accepts_nested_attributes_for :room_users, allow_destroy: true
end
