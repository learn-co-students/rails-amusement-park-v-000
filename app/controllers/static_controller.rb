class StaticController < ApplicationController
  skip_before_action :verify_user, only: [:home]
  
  def home 
  end
  
end
