class FlatsController < ApplicationController
  def index
    #@flats = Flat.where("LOWER(address_city) = :city AND capacity >= :guests", city: params[:city].downcase, guests: params[:guests])
    if params[:city].present? && params[:guests].present?
      @flats = Flat.near(params[:city].downcase, 20).where("capacity >= ?", params[:guests])
    else
      @flats = Flat.all
    end
    @markers = Gmaps4rails.build_markers(@flats) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
      marker.infowindow "toto"
      #{}"<button class='btn btn-success'><%= flat.title %></button>"
    end
  end

  def show
    @flat = Flat.find(params[:id])
    @flat_coordinates = [{ lat: @flat.latitude, lng: @flat.longitude }]
  end
end
