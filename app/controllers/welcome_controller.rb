class WelcomeController < ApplicationController

  before_action :authentication_required, only: [:new, :create, :update]

  def home
  end

end
