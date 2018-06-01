class UsersController < ApplicationController
  # skip_before_action :login_required, [ :new]
    
  def new
    @user = User.new
  end

end 