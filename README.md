Conversations
=

This project rocks big time and uses MIT-LICENSE.

Installation
-

1.   Add 
`gem "conversations"`
to your Gemfile.

* Run
`bundle install`.

* Add
`//= require conversations`
to
`app/assets/javascripts/application.js`
file.

* Add
`*= require conversations`
to
`app/assets/stylesheets/application.css`
file.

* Run
`rails g conversations`.

* Run
`rake db:migrate`.

* Add
`has_conversations`
to User model

* Add links to the conversations anywhere you want
`<%= link_to 'Messages', user_conversations_path(current_user) %>`

* Restart server if running

Notice
-

In order to have it work, you need to provide current user like this:
`app/controllers/application_controller.rb`

    def current_user
      User.find(session[:user_id])
    end

    helper_method :current_user

which is provided in Authentication Gems like devise already.