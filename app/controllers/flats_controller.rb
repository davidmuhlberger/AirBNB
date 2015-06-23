class FlatsController < ApplicationController

#add index def

  def show
    @flat = Flat.find(params[:id])
  end

end
