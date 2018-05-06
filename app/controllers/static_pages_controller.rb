class StaticPagesController < ApplicationController
  #skip_before_action :verify_user_is_authenticated, only: [:home]

  def home
  end


  private

  def verify_user_is_authenticated
    return head(:forbidden) unless logged_in?
  end

end
