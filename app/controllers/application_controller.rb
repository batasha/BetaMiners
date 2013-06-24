CATEGORIES = [ "Books", "Business", "Entertainment", "Finance", "Games",
               "Health & Fitness", "Lifestyle", "Music", "Navigation", "News",
               "Photography", "Productivity", "Reference", "Social", "Sports",
               "Travel", "Utilities", "Weather" ]

class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

end
