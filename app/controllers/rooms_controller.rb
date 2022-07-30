class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @user = current_user
  end

  def new
    @user = current_user
    @room = Room.new  
  end

  def create
    @room = Room.new(params.require(:room).permit(:room_name, :room_introduction, :price, :city))
    if @room.save
      redirect_to room_path(@room.id)
    else
      render "new"
    end
      
  end

  def show
    @user = current_user
    @rooms = current_user
  end

  def update
  end

  def destroy
  end
end
