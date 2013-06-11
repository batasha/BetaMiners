class Platform < ActiveRecord::Base
  attr_accessible :os, :browser, :version

  validates :os, inclusion: { in: "iOS", "Android", "Windows 8", "Windows 7",
                                  "Windows Vista", "Windows XP",
                                  "OS X Snow Leopard", "OS X Mountain Lion",
                                  "Linux" }

  validates :browser, inclusion: { in: "iPhone", "iPad", "Android Phone",
                                        "Android Tablet", "Firefox",
                                        "Internet Explorer", "Chrome", "Opera",
                                        "Safari"}
end