class ReservationsController < ApplicationController

  def new
    @rental = Rental.find(params[:rental_id])
    @reservation = @rental.reservations.new
  end

  def create
    @rental = Rental.find(params[:rental_id])
    @reservation = @rental.reservations.new(reservation_params)
    @reservation.user_id = current_user.id
    if @reservation.save
      redirect_to rental_path(@rental)
    else
      render 'new'
    end
  end

  private
  def reservation_params
     params.require(:reservation).permit(:rental_id, :user_id, :start_date, :end_date)
  end
end
