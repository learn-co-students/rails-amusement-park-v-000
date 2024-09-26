class StaticController < ApplicationController
  skip_before_action :user_verified, only: [:index]

  def index
  end

end
