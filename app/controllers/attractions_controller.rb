class AttractionsController < ApplicationController

    def new
        
    end
    
    def create
        @attraction=Attraction.new(attraction_params)
        @attraction.save
        redirect_to attraction_path(@attraction)
    
    end
    
    def index
        @user=User.find(session[:user_id])
        @attractions=Attraction.all
    end
    
    def show
        @attraction=Attraction.find(params[:id].to_i)
        @user=User.find(session[:user_id])
    end
    
    def edit
        @attraction=Attraction.find(params[:id].to_i)
    end
    
    def update
        @attraction=Attraction.find(params[:id].to_i)
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end
        
    
    private
    
    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :min_height, :happiness_rating, :nausea_rating)
    end
end
