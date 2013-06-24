class HomeController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    # Select random projects to feature on the home page
    @screens = Screenshot.includes(:project).sample(25)
  end
end