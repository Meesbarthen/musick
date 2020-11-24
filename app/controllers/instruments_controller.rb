class InstrumentsController < ApplicationController
  def index
    # @instruments = Instrument.all
    @instruments = Instrument.all
  end

  def show
    @instrument = Instrument.find(:id)
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @adduser = current_user
    raise
    if @instrument.save
      redirect_to instrument_path(@instrument)
    else
      render 'new'
    end
  end

  def edit
    @instrument = Instrument.find(:id)
  end

  def update
    @instrument = Instrument.find(:id)
    @instrument = Instrument.update(instrument_params)
    redirect_to instrument_path(@instrument)
  end

  def delete
    @instrument = Instrument.find(:id)
    @instrument.destroy
    redirect_to instruments_path
  end

private

  def instrument_params
    params.require(:instrument).permit(:name, :category, :description, :address, :price, :availability, photos: [])
  end
end
