class SessionsController < ApplicationController

  def new
  end

  def create
     # redirect_to controller: 'application', action: 'hello'
    user = User.find(params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}"
    else
      redirect_to '/signin'
    end
  end



  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end


  # def create #login action
  #   user = User.find_by(name: params[:user][:name])
  #   # binding.pry
  #   if user && user.authenticate(params[:user][:password])
  #     session[:user_id] = user.id
  #     redirect_to '/homepage'
  #   else
  #     redirect_to '/login'
  #   end
  # end
  #
  # def destroy
  #   session[:user_id] = nil
  #   redirect_to '/login'
  # end
