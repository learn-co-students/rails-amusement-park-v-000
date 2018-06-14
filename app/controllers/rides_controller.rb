class RidesController < ApplicationController
  def new

  end

  def create
    @attraction = Attraction.find_by(id: params[:id])
    if !current_user.too_short? & !current_user.too_broke?
      current_user.take_ride(@attraction)
      redirect_to user_path(current_user)
    else
      flash[:message] = take_ride(@attraction)
    end


  end

end
