class StaticController < ApplicationController

  def home
  end

  def login
  end

  def signup
  end

  def logout
    session.delete(:user_id)
  end
end
