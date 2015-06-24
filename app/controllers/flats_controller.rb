class FlatsController < ApplicationController
  def index
    @flats = Flat.where("LOWER(address_city) = :city AND capacity >= :guests", city: params[:city].downcase, guests: params[:guests])
  end

  def show
    @flat = Flat.find(params[:id])
  end
end
