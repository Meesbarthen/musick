class PagesController < ApplicationController
  def home
    @categories = Category.all
    @instruments = Instrument.all
  end
end
