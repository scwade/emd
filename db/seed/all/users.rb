#db/seed/all/users.rb
#All Environments base data
                   
u = User.create(:username => "admin", :email => "admin@localhost.com", :password => 'admin', :password_confirmation => 'admin')

  u.has_role!(:admin)#, PatientCondition)
  
### debug User.create(:username => "admin1", :email => "admin1@localhost.com", :password => 'admin1', :password_confirmation => 'admin1')

### List roles for object ### u.roles_for(nil).map(&:name).sort

