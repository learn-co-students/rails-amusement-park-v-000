class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # binding.pry
    if params[:user][:name] == nil || params[:user][:name].empty?
     redirect_to root_path
    #  controller: 'sessions', action: 'new'   
    else
     find_and_set_user
     redirect_to user_path(@user)
    end
  end


  private

  def find_and_set_user
    @user = User.find_by(name: params[:user][:name])
     session[:user_id] = @user.id
  end

end
