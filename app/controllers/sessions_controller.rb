class SessionsController < ApplicationController

  def new
  end

  def create
    # raise params.inspect
    if params[:user][:name].nil? || params[:user][:name] == ""
      redirect_to '/signin'
    else
      user = User.find_by(name: params[:user][:name])
      if user
        session[:user_id] = user.id
        redirect_to "/users/#{user.id}"
      else
        redirect_to'/signin'
      end
    end
  end

  def destroy
    session.delete :user_id if session[:user_id]
    redirect_to "/"
  end

end
