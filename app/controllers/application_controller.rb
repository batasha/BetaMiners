CATEGORIES = [ "Books", "Business", "Entertainment", "Finance", "Games", 
               "Health & Fitness", "Lifestyle", "Music", "Navigation", "News", 
               "Photography", "Productivity", "Reference", "Social", "Sports", 
               "Travel", "Utilities", "Weather" ]

OS_PLATFORMS = [ "iOS", "Android", "OS X", "Windows XP", "Windows 7",
                 "Windows 8", "Linux" ]

BROWSERS = [ "Firefox", "Internet Explorer", "Chrome", "Opera", "Safari" ]

class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

end
