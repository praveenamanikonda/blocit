## Blocit : a Reddit clone to teach the fundamentals of web development and Rails 4. 
Made with my mentor at [Bolc] (http://bloc.io).

About Blocit: The Blocit app allows users to create password-secured accounts, login/logout , User Authorization i.e ability to create/edit/delete Topics , posts , comment on posts, Vote i.e like/unlike posts, ranks posts,Favoriting posts , data validations, upload images.

This README would normally document whatever steps are necessary to get the
application up and running.

Ruby Version : rails 4.1.0

To view the app:
  start Rails server : rails s 
  Visit 'https://localhost:3000/'
  
To check app's available routes : rake routes 

Database creation : The development and production environments have different databases. Update your gem file such that it has the following:
  group :production do 
    gem 'pg'
    gem 'rails_12factor'
  end 

  group :development do 
    gem 'sqlite3'
  end 
  
  group :development, :test do
   gem 'rspec-rails', '~> 3.0'
   gem 'factory_girl_rails', '~> 4.0'
  end
  
Configuring production : 
  To configure email functionality for this app , you need to addon 'Sendgrid' on production. 
  Command for configuring : 
    heroku addons:create sendgrid:starter
    
Gems required for this app: 
 gem 'bootstrap-saas'
 gem 'faker'
 gem 'devise'
 gem 'pundit'
 gem 'figaro'
 gem 'redcarpet'
 gem 'carrierwave'
 gem 'mini_magick' 
 gem 'will_paginate'
 
