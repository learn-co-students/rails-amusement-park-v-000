class StaticPagesController < ApplicationController
  skip_before_action :verify_user_is_authenticated
  def home
  end
end