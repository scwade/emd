#db/seed/development/xx_patient_profiles.rb
#Development base data

### ROLLAND TODO - Please make this a rake action (this was messing up my seed environments)
# Delete all before seeding
# PatientProfile.delete_all

pp1 = PatientProfile.create( 
  :pmd_patient_id => "100000001",
  :pmd_user_id => "100000001",
  :physician_id => "10",
  :first_name =>  "Rolland",
  :last_name =>  "Hoyt",
  :primary_address =>  "32455 Capitola Ct",
  :alternate_address =>  "33691 Simple Ct",
  :city =>  "Union City",
  :zip5 =>  "94587",
  :zip4 =>  "1234",
  :state_province =>  "CO",
  :email =>  "rolland@proficientMD.com",
  :phone_home =>  "5104290790",
  :phone_mobile =>  "5105520948",
  :phone_work =>  "5105520948",
  :phone_fax =>  "5104290790",
  :phone_emergency =>  "5104290790",
  :date_of_birth => "2004-09-09",
  :gender =>  "M",
  :ethnicity => "12")
pp1.save 

pp2 = PatientProfile.create( 
  :pmd_patient_id => "100000002",
  :pmd_user_id => "100000002",
  :physician_id => "12",
  :first_name =>  "Jacki",
  :last_name =>  "Hoyt",
  :primary_address =>  "32455 Capitola Ct",
  :alternate_address =>  "33691 Simple Ct",
  :city =>  "Union City",
  :zip5 =>  "94587",
  :zip4 =>  "1234",
  :state_province =>  "AB",
  :email =>  "jacki@proficientMD.com",
  :phone_home =>  "5104290790",
  :phone_mobile =>  "5105520948",
  :phone_work =>  "5105520948",
  :phone_fax =>  "5104290790",
  :phone_emergency =>  "5104290790",
  :date_of_birth =>  "2005-09-24",
  :gender =>  "M",
  :ethnicity => "12")
pp2.save

pp3 = PatientProfile.create( 
  :pmd_patient_id => "100000003",
  :pmd_user_id => "100000003",
  :physician_id => "10",
  :first_name =>  "Whaky Jacky",
  :last_name =>  "Jacky",
  :primary_address =>  "32455 Capitola Ct",
  :alternate_address =>  "33691 Simple Ct",
  :city =>  "Union City",
  :zip5 =>  "94587",
  :zip4 =>  "1234",
  :state_province =>  "AB",
  :email =>  "wacky@proficientMD.com",
  :phone_home =>  "5104290790",
  :phone_mobile =>  "5105520948",
  :phone_work =>  "5105520948",
  :phone_fax =>  "5104290790",
  :phone_emergency =>  "5104290790",
  :date_of_birth =>  "2005-09-24",
  :gender =>  "F",
  :ethnicity => "12")
pp3.save 

pp4 = PatientProfile.create( 
  :pmd_patient_id => "100000004",
  :pmd_user_id => "100000004",
  :physician_id => "10",
  :first_name =>  "Chris",
  :last_name =>  "Hoyt",
  :primary_address =>  "32455 Capitola Ct",
  :alternate_address =>  "33691 Simple Ct",
  :city =>  "Union City",
  :zip5 =>  "94587",
  :zip4 =>  "1234",
  :state_province =>  "AB",
  :email =>  "chris@proficientMD.com",
  :phone_home =>  "5104290790",
  :phone_mobile =>  "5105520948",
  :phone_work =>  "5105520948",
  :phone_fax =>  "5104290790",
  :phone_emergency =>  "5104290790",
  :date_of_birth =>  "2005-09-24",
  :gender =>  "M",
  :ethnicity => "11")
pp4.save

pp5 = PatientProfile.create( 
  :pmd_patient_id => "111111111",
  :pmd_user_id => "111111111",
  :physician_id => "11",
  :first_name =>  "Scott",
  :last_name =>  "Wade",
  :primary_address =>  "3600 harbor",
  :alternate_address =>  "none",
  :city =>  "Oxnard",
  :zip5 =>  "93035",
  :zip4 =>  "1234",
  :state_province =>  "CA",
  :email =>  "scott@proficientMD.com",
  :phone_home =>  "5555555555",
  :phone_mobile =>  "5555555555",
  :phone_work =>  "5555555555",
  :phone_fax =>  "5555555555",
  :phone_emergency =>  "5555555555",
  :date_of_birth =>  "2005-09-24",
  :gender =>  "M",
  :ethnicity => "10")
pp5.save

pp6 = PatientProfile.create( 
  :physician_id => "12",
  :first_name =>  "brian",
  :last_name =>  "wade",
  :primary_address =>  "3600 harb",
  :state_province =>  "CO",
  :email =>  "brian1@aa.com",
  :date_of_birth =>  "1895-09-24",
  :gender =>  "M",
  :ethnicity => "African")
pp6.save 

