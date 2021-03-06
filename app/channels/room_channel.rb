class RoomChannel < ApplicationCable::Channel
  def subscribed
     stream_from "room_channel"
#    room = Room.where('id = ?',params[:id])
#    stream_for room
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create!(content: data['message']['message'], room_id: data['message']['current_room'], user_id: current_user.id)
  end
end
