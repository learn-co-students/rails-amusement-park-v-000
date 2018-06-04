class AttractionsController < ApplicationController

    def index
        if logged_in? 
        @attractions = Attraction.all 
        @user = User.find(session[:user_id])
        else 
        redirect_to root_path
        end
    end
    
    def new
        if logged_in? 
        @attraction = Attraction.new
        @user = User.find(session[:user_id])
        else 
        redirect_to root_path
        end
    end
    
    def show 
        @attraction = Attraction.find_by(id: params[:id])
        @user = current_user
    end
    
    def create 
        @attraction = Attraction.new(attraction_params)
        if @attraction.save 
            redirect_to attraction_path(@attraction)
        else 
            redirect_to new_attraction_path
        end
    end
    
    def edit 
        @attraction = Attraction.find_by(id: params[:id])
    end
    
    def update
        @attraction = Attraction.find_by(id: params[:id])
        if @attraction.update(attraction_params)
            redirect_to attraction_path(@attraction)
        else
            redirect_to edit_attraction_path
        end
    end
    
    private 
    
    
    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end
    
end