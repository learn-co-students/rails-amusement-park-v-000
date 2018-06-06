class AttractionsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index

  end

  def new

  end

  def create
  end

  def show

  end

  # Only visible to admins (though apparently accessible by anyone through url in demo...)
  def edit
  end

  def update
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

end
