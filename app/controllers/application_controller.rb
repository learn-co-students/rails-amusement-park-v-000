class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def user_signup
    @user = User.new do |u|
     u.name = params[:user]['name']
     u.height = params[:user]['height']
     u.happiness = params[:user]['happiness']
     u.nausea = params[:user]['nausea']
     u.tickets = params[:user]['tickets']
     u.admin = params[:user]['admin']
     u.password = params[:user]['password']
    end
   if @user.save
     session[:user_id] = @user.id
     redirect_to user_path(@user)
   else
     redirect_to '/users/new'
   end
  end

  def user_login
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/sessions/new'
    end
  end

end
