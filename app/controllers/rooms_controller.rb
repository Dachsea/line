class RoomsController < ApplicationController
  def show
  end
  
  def index
    @rooms = Room.all
  end
  
  def new
    @room = Room.new
    @room.room_users.build
  end
  
  def create
    @room = Room.new(room_params)
    if @room.save
      #@roomがDBにないからビルド出来ない？
      @room.room_users.create(user_id: params[:room_users][:user_id])
      @room.room_users.create(user_id: current_user.id)
      redirect_to @room ,notice: "チャットルームが作成できました"
    else
      render :new
    end
  end
  
  private
    def room_params
      params.require(:room).permit(:name)
    end
end
