class AttractionsController < ApplicationController
    before_action :admin_shield, only: [ :new, :create, :edit, :update, :destroy ]
    def index
        @attractions = Attraction.all
    end
    
    def show
        check_attract 
    end
    
    def new
        @attraction = Attraction.new
    end
    
    def create
        @attraction = Attraction.new(attr_params)
        if @attraction.save
            redirect_to attraction_path(@attraction)
        else
            render :new
        end
    end
    
    def edit
        @attraction = Attraction.find(params[:id])
    end
    
    def update
        check_attract
        if @attraction.update(attr_params)
            redirect_to attraction_path(@attraction) 
        else
            render :edit
        end
    end
    
    private
    
    def attr_params
        params.require(:attraction).permit([:name, :tickets, :nausea_rating, :happiness_rating, :min_height])
    end
    
    def check_attract
        @attraction = Attraction.find(params[:id])
    end

    def current_user
        current_user ||= User.find_by(id: session[:user_id])
    end
    
    def admin_shield
        redirect_to attractions_path if current_user.admin != true
    end
end
