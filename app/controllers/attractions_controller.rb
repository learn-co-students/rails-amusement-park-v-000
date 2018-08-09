require 'pry'
class AttractionsController < ApplicationController

    def index
        redirect_to '/' if !logged_in?
        @attractions = Attraction.all
    end

    def show
        redirect_to '/' if !logged_in?
        @attraction = Attraction.find(params[:id])
        @user = current_user
    end
end