module Users
  class FlatsController < ApplicationController

    before_action :authenticate_user!

    def new
      @flat = Flat.new
    end

    def create
      @flat = current_user.flats.build(flat_params)
      if @flat.save
        redirect_to user_path
      else
        render :new
      end
    end

    def edit
      @flat = current_user.flats.find(params[:id])
    end

    def update
      @flat = current_user.flats.find(params[:id])
      @flat.update(flat_params)
      redirect_to user_path
    end

    def destroy
      @flat = current_user.flats.find(params[:id])
      @flat.destroy
      redirect_to :back
    end

    private

    def flat_params
      params.require(:flat).permit(:title, :description, :address_numberstreet, :address_city, :address_zip, :night_price, :capacity, :picture)
    end

  end
end
