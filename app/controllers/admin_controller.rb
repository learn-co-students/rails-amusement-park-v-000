class AdminController < ActionController::Base

  def show
    @user = User.find(params[:id])
  end

end