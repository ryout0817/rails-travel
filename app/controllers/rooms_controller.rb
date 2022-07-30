class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @user = User.all
  end

  def new
    @room = Room.new  
  end

  def create
    @room = Room.new(params.require(:room).permit(:room_name, :room_introduction, :price, :city))
    @user_id = current_user.id
    if @room.save
      redirect_to room_path(@room.id)
      
      binding.pry
      
    else
      render "new"
    end
      
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
