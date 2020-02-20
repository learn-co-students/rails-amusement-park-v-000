class RidesController < ApplicationController

    def new
    end

    def create
        @ride = Ride.new
    end
end
