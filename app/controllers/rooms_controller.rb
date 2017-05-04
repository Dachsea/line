class RoomsController < ApplicationController
  def show
  end
  
  def new
    @room = Room.new
    @room.room_users.build
  end
  
  def create
    @room = Room.new(room_params)
    if @room.save
      #@roomがDBにないからビルド出来ない？
      @room_user = @room.room_users.build(user_id: params[:room_users][:user_id])
      @room_user.save
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
