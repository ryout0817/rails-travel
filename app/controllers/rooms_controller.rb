class RoomsController < ApplicationController
  def index
    @user = current_user
    @rooms = Room.all
  end

  def new
    @user = current_user
    @room = Room.new  
  end

  def create
    @room = Room.new(params.require(:room).permit(:room_name, :room_introduction, :price, :city, :room_image))
    if @room.save
      redirect_to rooms_path(@room)
    else
      render "new"
    end
      
  end

  def show
    @user = current_user
    @rooms = Room.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
