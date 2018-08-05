class SessionsController < ApplicationController

  def new
  end

  def create
  end

  def delete
    session.destroy :user_id
    redirect_to '/'
  end

end
