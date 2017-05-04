class AddColumnToRoomUsers < ActiveRecord::Migration[5.0]
  def change
    drop_table :room_users
  end
end
