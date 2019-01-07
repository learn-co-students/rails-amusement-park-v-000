class StaticController < ApplicationController

  def home
  end

  def login
  end

  def signup
  end

  def logout
    session.delete(:user_id)
    redirect_to root_url
  end
end
