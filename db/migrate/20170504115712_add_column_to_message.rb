class AddColumnToMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :messages,:room_id,:integer,null: false
  end
end
