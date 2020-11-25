class BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
      @bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @instrument = Instrument.find(params[:instrument_id])
    @booking = Booking.new(booking_params)
    @booking.price = (@booking.end_date - @booking.begin_date).to_i * @instrument.price
    @booking.instrument = @instrument
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      p @booking.errors
      render "instruments/show"
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update!(booking_params)
    @booking.update!( price: (@booking.end_date - @booking.begin_date).to_i * @booking.instrument.price)
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

private

  def booking_params
    params.require(:booking).permit(:begin_date, :end_date)
  end
end
