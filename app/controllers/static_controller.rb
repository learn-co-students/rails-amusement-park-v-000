class StaticController < ApplicationController
  skip_before_action :verified_user, only: [:home]

  def home
  end
end