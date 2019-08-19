class AttractionsController < ApplicationController

    def new
        @attraction = Attraction.new
    end

    def index
        @attractions = Attraction.all
    end

end
