class AttractionsController < ApplicationController

def index
    @attractions = Attraction.all
end

def show(attraction)
    @attraction = Attraction.find_by(attraction.id)
end

end
