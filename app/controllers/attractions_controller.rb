require 'pry'
class AttractionsController < ApplicationController
  before_action :set_attraction, only:[:show, :edit, :update, :destroy]


    def index
      @attractions = Attraction.all
      current_user
    end

    def new
      @attraction = Attraction.new
    end


    def create
      @attraction = Attraction.create(attraction_params)
      if @attraction.save
         redirect_to attraction_path(@attraction)
      else
        redirect_to new_attraction_path
      end
    end


    def show
      # binding.pry
      @user = User.find_by_id(session[:user_id])
    end

    def edit
    end

    def update
      @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    end

    def destroy
    end


     private

    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, :tickets, :nausea_rating)
    end


    def set_attraction
      @attraction = Attraction.find(params[:id])
    end





end
