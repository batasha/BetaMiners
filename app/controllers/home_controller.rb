class HomeController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @screens = Screenshot.includes(:project).all
  end
end