class SessionsController < ApplicationController
  def new
    #@user = User.new
    #binding.pry
  end

  def create 
    #binding.pry
    @user = User.find_by(name: params[:user_name])
    #binding.pry
    if @user
    return redirect_to 'signin' unless @user.authenticate(params[:password])
    session[:user_id] = @user.id 
    redirect_to "/users/#{@user.id}"
    end
    
  end 

  def destroy
    session.delete :user_id 
    redirect_to '/'
  end 
end
