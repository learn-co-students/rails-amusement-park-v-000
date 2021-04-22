
require 'pry'
class SessionsController < ApplicationController
    before_action :require_login, only: [:show, :edit, :update, :destroy]
    
    def new
    end

    def create
        @user = User.find_by(:name => params[:user][:name])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
          redirect_to root_path
        end
    end

    #<ActionController::Parameters {"utf8"=>"✓", 
    #"authenticity_token"=>"sQaQ2KV8dzAVIu2YvkLFO_rQyExgKdCzIL-OD4ZEtvkscjkLNHo9g8E7FbK99qpzQIn22dxx4LjcPJ_uo0QKqA", 
    #"user"=>{"name"=>"Buffy"}, 
    #"password"=>"5", 
    #"commit"=>"Sign In", 
    #"controller"=>"sessions", 
    #"action"=>"create"} permitted:

    def destroy 
      if current_user
        session.delete(:user_id)
        redirect_to root_path
      end   
    end

end