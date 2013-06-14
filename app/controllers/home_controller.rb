class HomeController < ApplicationController
  def index
    @images = Screenshot.all.map(&:image)
  end
end