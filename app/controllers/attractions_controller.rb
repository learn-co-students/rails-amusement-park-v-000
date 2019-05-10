class AttractionsController < ApplicationController
    before_action :require_login
    
    def index
        @attractions = Attraction.all
        @user = current_user
    end

    def show
        #binding.pry
        @attraction = Attraction.find_by(id: params[:id])
        
    end

    def new

    end

    def create
        
    end

    private

    def require_login
        if !session.include? :user_id
            redirect_to '/'
        end
    end
end