#db/seed/development/users.rb
#Development base data
                   
user1 = User.new(:username => "Dave", 
  :crypted_password => 'secret',
  :password_confirmation => 'secret')
user1.save  

user2 = User.create(:username => "scott", 
  :password => 'secret',
  :password_confirmation => 'secret')
user2.save

user3 = User.create(:username => "Tiffany", 
  :password => 'secret',
  :password_confirmation => 'secret')
user3.save

user4 = User.create(:username => "Rolland", 
  :password => 'secret',
  :password_confirmation => 'secret')
user4.save

user5 = User.create(:username => "Jacki", 
  :password => 'secret',
  :password_confirmation => 'secret')
user5.save

user6 = User.create(:username => "Maria", 
  :password => 'secret',
  :password_confirmation => 'secret')
user6.save
