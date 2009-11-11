#db/seed/development/users.rb
#Development base data

# Delete all before seeding
# User.delete_all

user = %w(scott maria rolland jacki chris lisa)

user.each do |t|
  User.create(:username => t, 
              :email    => t + "@yahoo.com",
              :password => t,
              :password_confirmation => t ) 
end
