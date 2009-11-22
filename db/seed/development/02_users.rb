#db/seed/development/users.rb
#Development base data

### ROLLAND TODO - Please make delete a rake action (this was messing up my seed environments)

### Debug - Using Authlogic in the console - HINTS:
### http://www.tatvartha.com/2009/09/working-with-authlogic-in-scriptconsole/
### load into console; create new UserSession (to login)
# Authlogic::Session::Base.controller = Authlogic::ControllerAdapters::RailsAdapter.new(self)
# us = UserSession.new(:email => 'admin@localhost.com', :username => 'admin', :password => 'admin')

### for testing
#require 'authlogic'
#require 'acl9'
# require "authlogic/test_case"
#include Authlogic::TestCase
#setup :activate_authlogic
#UserSession.create(users(:admin))

### Setup Patient user accounts
user = %w(dave scott tiffany maria rolland jacki chris lisa)

user.each do |t|
  u = User.create(:username => t, 
              :email    => t + "@localhost.com",
              :password => t,
              :password_confirmation => t ) 
  u.has_role!(:patient)
end

### Setup Doctors user accounts
user = %w(wade chao reeves madany wang)

user.each do |t|
  u = User.create(:username => t, 
              :email    => t + "@localhost.com",
              :password => t,
              :password_confirmation => t ) 
  u.has_role!(:doctor)
end

### Setup Clerk user accounts
user = %w(laura blanca)

user.each do |t|
  u = User.create(:username => t, 
              :email    => t + "@localhost.com",
              :password => t,
              :password_confirmation => t ) 
  u.has_role!(:clerk)
end
