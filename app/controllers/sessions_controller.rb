class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    #byebug
    @user = User.find_by(name: params[:name])
    byebug
    #return head(:forbidden) unless @user.authenticate(params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to @user
    end
  end
end
