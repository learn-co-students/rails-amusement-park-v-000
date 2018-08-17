class WelcomeController < ApplicationController

  def home
    @user = User.new 
    render :template => "sessions/new"
  end

end
