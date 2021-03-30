class RidesController < ApplicationController
  before_action :authentication_required

 def create
     ride = Ride.create(:user_id => current_user.id, :attraction_id => params[:attraction_id])
 end

end
