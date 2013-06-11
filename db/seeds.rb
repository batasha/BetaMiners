# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
platforms = Platform.create([
  { os: "iOS", browser: "iPhone", version: "5.0" },
  { os: "iOS", browser: "iPhone", version: "5.1" },
  { os: "iOS", browser: "iPhone", version: "6" },
  { os: "iOS", browser: "iPad", version: "5.0" },
  { os: "iOS", browser: "iPad", version: "5.1" },
  { os: "iOS", browser: "iPad", version: "6" },
  { os: "Android", browser: "Android Phone", version: "4.0" },
  { os: "Android", browser: "Android Tablet", version: "4.0" },
  { os: "Windows 8", browser: "Firefox", version: "16" },
  { os: "Windows 8", browser: "Firefox", version: "17" },
  { os: "Windows 8", browser: "Firefox", version: "18" },
  { os: "Windows 8", browser: "Firefox", version: "19" },
  { os: "Windows 8", browser: "Firefox", version: "20" },
  { os: "Windows 8", browser: "Firefox", version: "21" },
  { os: "Windows 8", browser: "Internet Explorer", version: "10" },
  { os: "Windows 7", browser: "Chrome", version: "27" },
  { os: "Windows 7", browser: "Firefox", version: "16" },
  { os: "Windows 7", browser: "Firefox", version: "17" },
  { os: "Windows 7", browser: "Firefox", version: "18" },
  { os: "Windows 7", browser: "Firefox", version: "19" },
  { os: "Windows 7", browser: "Firefox", version: "20" },
  { os: "Windows 7", browser: "Firefox", version: "21" },
  { os: "Windows 7", browser: "Internet Explorer", version: "10" },
  { os: "Windows 7", browser: "Chrome", version: "27" },
  { os: "Windows 8", browser: "Firefox", version: "16" },
  { os: "Windows 8", browser: "Firefox", version: "17" },
  { os: "Windows 8", browser: "Firefox", version: "18" },
  { os: "Windows 8", browser: "Firefox", version: "19" },
  { os: "Windows 8", browser: "Firefox", version: "20" },
  { os: "Windows 8", browser: "Firefox", version: "21" },
  { os: "Windows 8", browser: "Internet Explorer", version: "10" },
  { os: "Windows 8", browser: "Chrome", version: "27" }
])