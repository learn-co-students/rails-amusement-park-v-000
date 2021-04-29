class RidesController < ApplicationController

    def create
        # I realized this is done this way because of the
        # assocations of the models (a ride is comprised
        # of the user and the attraction)
        ride = Ride.create(ride_params)
        # remember! take_ride returns a message!
        message = ride.take_ride
        # this was a new syntax, devined from the solution,
        # but I like it and will be using it. Also, the ride
        # has a user (associations, remember?!) so you can
        # pass the object for Rails to determine the user_id
        redirect_to user_path(ride.user), flash: {message: message}
    end

    private

    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end

end