class SessionsController < ApplicationController
  def new
  end

  def create
    render 'new'
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
