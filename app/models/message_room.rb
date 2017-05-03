class MessageRoom < ApplicationRecord
  belong_to :message
  belong_to :room
end
