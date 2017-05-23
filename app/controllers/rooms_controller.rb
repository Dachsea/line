class RoomsController < ApplicationController
  def show
    @messages = Message.where('room_id = ?',params[:id]).order(:created_at)
    @room = Room.find_by(id: params[:id])
  end
  
  def index
    @rooms = Room.joins(:room_users).where('user_id = ?',current_user.id)
  end
  
  def new
    @room = Room.new
    @room.room_users.build
    #自分の名前が選択ボックスに表示されないようにnotメソッド使用
    @users = User.where.not(id: current_user.id)
  end
  
  def create
    param = room_params
    param[:user_ids] << current_user.id
    @room = Room.new(param)
    if @room.save
      redirect_to @room ,notice: "チャットルームが作成できました"
    else
      render :new
    end
  end
  
  private
    def room_params
      params.require(:room).permit(:name, user_ids: [])
    end
end
