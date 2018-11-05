class SessionsController < ApplicationController

  def new
    @user = User.new
    @users = User.all
  end

  def create
    # raise params.inspect
    user = User.find_by(name: params[:user][:name])
    user = user.try(:authenticate, params[:password])
    return redirect_to(controller: 'sessions', action: 'new') unless user
    session[:user_id] = user.id
    redirect_to controller: 'users', action: 'show', id: user.id
  end

  def destroy
    #raise params.inspect
    session.delete :user_id
    @current_user = nil
    redirect_to controller: 'welcome', action: 'home'
  end
end
