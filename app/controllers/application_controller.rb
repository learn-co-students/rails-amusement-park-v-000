class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  protect_from_forgery with: :exception


  def home
    render template: "/home"
  end
end
