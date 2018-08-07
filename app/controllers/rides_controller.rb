class RidesController < ActionController::Base

	def create 
		user = User.find_by(:id => params[:user_id])
		attraction = Attraction.find_by(:id => params[:attraction_id])

		ride = Ride.create(:user_id => user.id, :attraction_id => attraction.id)
		session[:notice] = ride.take_ride

		redirect_to user_path(user)
	end

end