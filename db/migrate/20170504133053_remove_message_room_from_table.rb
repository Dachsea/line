class RemoveMessageRoomFromTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :message_rooms
  end
end
