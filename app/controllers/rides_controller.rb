class RidesController < ApplicationController



  private

  def ride_params
    params.permit(:user_id, :attraction_id)
  end
end
