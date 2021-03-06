BetaMiners
==========
A croudsourcing platform for beta testing web applications, created for my App Academy capstone project. BetaMiners is a place for web developers to find eager testers, and users to discover cool new projects!

http://beta-miners.herokuapp.com

Technologies Used:
------------------
- Ruby
- Rails
- JavaScript
- jQuery
- AJAX
- UJS
- Devise
- OAuth
- Facebook API
- HTML
- CSS
- Paperclip

This app uses [Amazon Web Services](http://aws.amazon.com/s3/) for image storage and the [Facebook Graph API](https://developers.facebook.com/docs/reference/api/) for user registration/authentication. The following authentication keys can be set using the [Figaro](https://github.com/laserlemon/figaro) gem:

```ruby
# AWS Keys
ENV["S3_KEY"]
ENV["S3_SECRET"]

# Facebook Keys
ENV["APP_ID"]
ENV["APP_SECRET"]
```

To Do:
------
- Mailers
- Gamification
- Public comments for projects
- Make all JS unobtrusive
