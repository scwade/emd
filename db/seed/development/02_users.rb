#db/seed/development/users.rb
#Development base data

### ROLLAND TODO - Please make delete a rake action (this was messing up my seed environments)

user = %w(dave scott tiffany maria rolland jacki chris lisa)

user.each do |t|
  User.create(:username => t, 
              :email    => t + "@localhost.com",
              :password => t,
              :password_confirmation => t ) 
end
