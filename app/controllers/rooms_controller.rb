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
