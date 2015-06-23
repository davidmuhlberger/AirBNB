class FlatsController < ApplicationController
  before_action :find_user

  def index_user
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = @user.flats.build(flat_params)
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.update(flat_params)
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to :back
  end

  private

  def flat_params
    params.require(:flat).permit(:title, :description, :address_numberstreet, :address_zip,
      :address_city, :address_state, :address_country, :night_price, :capacity)
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
