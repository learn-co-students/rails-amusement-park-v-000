class StaticController < ApplicationController
  skip_before_action :verify_user_is_authenticated, only: [:homepage]
  def homepage
  end
end
