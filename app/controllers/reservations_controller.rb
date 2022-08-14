class ReservationsController < ApplicationController
  def index
    @user = current_user
    @reservations = Reservation.all
    
  end

  def new
    @user = current_user
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new(params.permit(:start_day, :finish_day, :total_amount, :people, :user_id, :room_id))
    @days = (@reservation.finish_day - @reservation.start_day).to_i
    @prices = @reservation.people * @room.price * @days
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:start_day, :finish_day,:people, :total_amount, :user_id, :room_id))
    @room = Room.find(params[:reservation][:room_id])
    if @reservation.save
      redirect_to reservation_path(@reservation.id)
    else
      render "new"
    end
  end

  def show
    @user = current_user
    @reservation = Reservation.find(params[:id])
    @room = @reservation.room
  end
end
