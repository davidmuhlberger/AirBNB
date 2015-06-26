class FlatsController < ApplicationController
  def index
    #@flats = Flat.where("LOWER(address_city) = :city AND capacity >= :guests", city: params[:city].downcase, guests: params[:guests])
    if params[:city].present? && params[:guests].present?
      @flats = Flat.near(params[:city].downcase, 500).where("capacity >= ?", params[:guests])
    elsif params[:city].present? && !params[:guests].present?
      @flats = Flat.near(params[:city].downcase, 500)
    else
      @flats = Flat.all
    end
    @markers = Gmaps4rails.build_markers(@flats) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
      marker.infowindow "<img src=#{flat.picture.url(:thumb)} alt=""> <br> <h5 class='text-center text-primary'><strong>#{flat.night_price} &euro; per night</strong></h5>"
    end
  end

  def show
    @flat = Flat.find(params[:id])
    @flat_coordinates = [{ lat: @flat.latitude, lng: @flat.longitude }]
  end
end
