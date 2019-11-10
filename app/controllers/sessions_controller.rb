class SessionsController < ApplicationController
  def new
    render :plain => "This is the #new action controller in the sessions controller"
  end

  def create
    render :plain => "This is the #create action controller in the sessions controller"
  end

  def destroy
    render :plain => "This is the #destroy action controller in the sessions controller"
  end
end
