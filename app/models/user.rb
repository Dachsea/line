class User < ApplicationRecord
  has_many :room_users
  has_many :rooms, through: :room_users

  has_secure_password
end
