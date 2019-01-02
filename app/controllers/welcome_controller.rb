class WelcomeController < ApplicationController
  skip_before_action :require_logged_in

  def home
  end

end
