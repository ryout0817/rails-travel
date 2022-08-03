class RoomsController < ApplicationController
  def index
    @user = current_user
    @rooms = Room.where(user_id:@user.id) #個人で登録したルームを見るのに必要
  end

  def new
    @user = current_user
    @room = Room.new  
  end

  def create
    @room = Room.new(params.require(:room).permit(:room_name, :room_introduction, :price, :city, :room_image, :user_id))
    if @room.save 
      redirect_to @room
    else
      render "new"
    end
      
  end

  def show
      @user = current_user
      @room = Room.where(id: params[:id])
      
  end
end
