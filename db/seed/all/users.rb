#db/seed/all/users.rb
#All Environments base data
                   
User.create(:username => "admin", 
  :email => "admin@localhost.com",
  :password => 'admin',
  :password_confirmation => 'admin')
