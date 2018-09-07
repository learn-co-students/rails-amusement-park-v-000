class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        sessions[:user_id] = @user.id
        format.html { render :new }
      end
    end
  end

  
end
