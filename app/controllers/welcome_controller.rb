class WelcomeController < ApplicationController
  def home
    render template: 'static/home'
  end
end
