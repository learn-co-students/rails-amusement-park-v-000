class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception

  def index
    render :index
  end
end
