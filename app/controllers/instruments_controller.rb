class InstrumentsController < ApplicationController
  def index
    if params[:category].present?
      @instruments = Instrument.joins(:category).where(categories: { name: params[:category] })
    else
      @instruments = Instrument.all
    end

    if params[:begin_date].present? && params[:end_date].present?
      begin_date = Date.parse(params[:begin_date])
      end_date = Date.parse(params[:end_date])
      @instruments = @instruments.available_between(begin_date, end_date)
    end

    if params[:query].present?
      sql_query = "name ILIKE :query OR description ILIKE :query"
      @instruments = @instruments.where(sql_query, query: "%#{params[:query]}%")
    end

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
    @owner = @instrument.user
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
