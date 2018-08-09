require 'pry'
class AttractionsController < ApplicationController
    before_action :verify_login
    before_action :verify_admin, :except => [:index, :show]

    def index
        @attractions = Attraction.all
        if is_admin?
            render "index_for_admin"
        end
    end

    def show
        @attraction = Attraction.find(params[:id])
        @user = current_user
    end

    def new
        @attraction = Attraction.new
    end

    def create

        @attraction = Attraction.new(attraction_params)   
        if !@attraction.save
            redirect_to new_attraction_path 
        end      
        redirect_to @attraction
    end

    def edit
        @attraction = Attraction.find(params[:id])
    end

    def update
        @attraction = Attraction.find(params[:id])

        @attraction.update(attraction_params)
    
        if @attraction.save
          redirect_to @attraction
        else
          render :edit
        end
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end

    def verify_login
        redirect_to '/' if !logged_in?
    end

    def verify_admin
        redirect_to '/' if !is_admin?
    end
end