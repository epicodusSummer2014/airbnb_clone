class RentalsController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @rentals = Rental.all
  end

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    if @rental.save
      respond_to do |format|
        format.html { redirect_to rentals_path }
        format.js
      end
    else
      render 'new'
    end
  end

  def show
    @rental = Rental.find(params[:id])
  end

  private
  def rental_params
     params.require(:rental).permit(:description, :price, :city, :state, :address, :bedrooms, :rental_photo)
  end

end
