class InstrumentsController < ApplicationController
  def index
    # @instruments = Instrument.all
    @instruments = Instrument.all
  end

  def show
    @instrument = find_params
    @booking = Booking.new
  end

  def new
    @instrument = Instrument.new
  end

  def create
    instrument = Instrument.new(instrument_params)
    instrument.user = current_user
    if instrument.save
      redirect_to instrument_path(instrument)
    else
      render 'new'
    end
  end

  def edit
    @instrument = find_params
  end

  def update
    @instrument = find_params
    @instrument = Instrument.update(instrument_params)
    redirect_to instrument_path(@instrument)
  end

  def delete
    @instrument = find_params
    @instrument.destroy
    redirect_to instruments_path
  end

private

  def instrument_params
    params.require(:instrument).permit(:name, :category, :description, :address, :price, :availability, photos: [])
  end

  def find_params
    Instrument.find(params[:id])
  end
end
