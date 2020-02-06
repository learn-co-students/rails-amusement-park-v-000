class AttractionsController < ApplicationController

    def create
        if valid_user
        @user = User.create(name: params[:name], password: params[:password])
    end

    
end
