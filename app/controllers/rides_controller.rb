class RidesController < ApplicationController

    def new
        take_ride
    end

    def create
        @ride = Ride.new
    end
end
