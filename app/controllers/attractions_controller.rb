class AttractionsController < ApplicationController
    before_action :set_attraction, only: [:show]
    def index
        @attractions = Attraction.all
        @user= current_user
    end
    def show
        @user= current_user
    end

    private
    def set_attraction
        @attraction = Attraction.find_by(id: params[:id])
    end

end
