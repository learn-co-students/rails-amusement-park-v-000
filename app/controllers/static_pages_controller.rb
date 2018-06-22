class StaticPagesController < ApplicationController

  def home
    render :layout => false
  end
end
