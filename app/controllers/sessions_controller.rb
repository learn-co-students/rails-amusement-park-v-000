class SessionsController < ApplicationController
  
  def home
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by()
  end

end
