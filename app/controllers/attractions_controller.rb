class AttractionsController < ApplicationController
    before_action :admin?
    skip_before_action :admin?, only: [:index, :show]
    def index
        @attractions = Attraction.all
    end

    def show
        @attraction = Attraction.find(params[:id])
        session[:attraction_id] = @attraction.id
    end

    def new
        @attraction = Attraction.new
    end

    def create
      @attraction = Attraction.new(attraction_params)
      if @attraction.save
        redirect_to attraction_path(@attraction)
      else
        redirect_to attractions_path
      end
    end
    
    def edit
        @attraction = Attraction.find(params[:id])
    end

    def update
        @attraction = Attraction.find(params[:id])
        
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction) 
    end
    private

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end

    def admin?
        @user = User.find(session[:user_id])
        if @user.admin
            true
        else
            redirect_to user_path(@user)
        end
    end
end
