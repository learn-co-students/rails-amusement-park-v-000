class AttractionsController < ApplicationController

    def new
        @attraction=Attraction.new
    end
    
    def create
    
    end
    
    def index
        @attractions=Attraction.all
    end
    
    def show
        @attraction=Attraction.find(params[:id].to_i)
        @user=User.find(session[:user_id])
    end
    
end
