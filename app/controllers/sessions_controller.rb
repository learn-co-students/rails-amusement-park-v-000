class SessionsController < ApplicationController

  def new
    @users = User.all
  end
end
