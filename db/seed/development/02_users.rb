#db/seed/development/users.rb
#Development base data

# Delete all before seeding
User.delete_all
                   
user1 = User.create(:name => "Dave", 
  :password => 'secret',
  :password_confirmation => 'secret')
user1.save  

user2 = User.create(:name => "scott", 
  :password => 'secret',
  :password_confirmation => 'secret')
user2.save

user3 = User.create(:name => "Tiffany", 
  :password => 'secret',
  :password_confirmation => 'secret')
user3.save

user4 = User.create(:name => "Rolland", 
  :password => 'secret',
  :password_confirmation => 'secret')
user4.save

user5 = User.create(:name => "Jacki", 
  :password => 'secret',
  :password_confirmation => 'secret')
user5.save

user6 = User.create(:name => "Maria", 
  :password => 'secret',
  :password_confirmation => 'secret')
user6.save
