class UserController < ApplicationController
  def welcome
    @user = User.find_by(id: params[:id])
  end
end
