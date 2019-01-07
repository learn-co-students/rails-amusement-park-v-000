class StaticController < ApplicationController

  def home
  end

  def signin
  end

  def logout
    session.delete(:user_id) if session[:user_id]
    redirect_to root_url
  end
end
