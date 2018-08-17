class SessionsController < ApplicationController
  def new
  end

  def create
    # logs you in with the correct password
    # user has entered login info
    # check the login info (name + password) against database
    # if match, that is the user - create a session
    # if no match, redirect to login
  end
end
