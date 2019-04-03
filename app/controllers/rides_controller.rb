class RidesController < ApplicationController

  def new
  end

  def create
    @user = User.find(params[:id])

    @user.take_ride

    redirect_to '/users/#{@user.id}'

  end

end
