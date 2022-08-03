class ReservationsController < ApplicationController
  def index
  end

  def new
    @user = current_user
    @room = current_user
    @reservation = Reservation.new
  end

  def create
    
  end
end
