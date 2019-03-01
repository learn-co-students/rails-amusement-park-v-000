require 'rack-flash'
class ApplicationController < ActionController::Base
  use Rack::Flash
  protect_from_forgery with: :exception
end
