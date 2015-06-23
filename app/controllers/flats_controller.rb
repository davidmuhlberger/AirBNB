class FlatsController < ApplicationController

  def index
    @flats = Flat.where("address_city = :city AND capacity >= :guests", city: params[:city], guests: params[:guests])

    #(address_city: params[:city], capacity: params[:guests])



  end

  def show
    @flat = Flat.find(params[:id])
  end

end
