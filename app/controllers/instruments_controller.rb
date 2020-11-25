class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.all

    @markers = @instruments.geocoded.map do |instrument|
      {
        lat: instrument.latitude,
        lng: instrument.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { instrument: instrument })
      }
    end
  end

  def show
    @instrument = find_params
    @booking = Booking.new
    @user = current_user
  end

  def new
    @instrument = Instrument.new
  end

  def create
    instrument = Instrument.new(instrument_params)
    instrument.user = current_user
    instrument.category = Category.find(params[:instrument][:category_id])

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

  def destroy
    @instrument = find_params
    @instrument.destroy
    redirect_to instruments_path
  end

private

  def instrument_params
    params.require(:instrument).permit(:name, :description, :address, :price, :availability, photos: [])
  end

  def find_params
    Instrument.find(params[:id])
  end
end
