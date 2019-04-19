class UsersController < ApplicationController

  def new
    @user = User.create
  end

end
