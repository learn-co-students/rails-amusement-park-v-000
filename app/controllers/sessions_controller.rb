class SessionsController < ApplicationController

  def new
  end

  def create
    # binding.pry
    session[:username] = params[:username]
        redirect_to '/'
  end
end
