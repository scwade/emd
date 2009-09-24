#db/seed/development/01_patient_profiles.rb
#Development base data

pp1 = PatientProfile.create( 
  :pmd_patient_id => "100000001",
  :pmd_user_id => "100000001",
  :physician_id => "100000001",
  :first_name =>  "Rolland",
  :last_name =>  "Hoyt",
  :primary_address =>  "32455 Capitola Ct",
  :alternate_address =>  "33691 Simple Ct",
  :city =>  "Union City",
  :zip_5 =>  "94587",
  :zip_4 =>  "1234",
  :state_province =>  "AB",
  :email =>  "rolland@proficientMD.com",
  :phone_home =>  "5104290790",
  :phone_mobile =>  "5105520948",
  :phone_work =>  "5105520948",
  :phone_fax =>  "5104290790",
  :phone_emergency =>  "5104290790",
  :date_of_birth =>  "19570902",
  :gender =>  "M",
  :ethnicity => "12")
pp1.save 

pp2 = PatientProfile.create( 
  :pmd_patient_id => "100000002",
  :pmd_user_id => "100000002",
  :physician_id => "100000002",
  :first_name =>  "Jacki",
  :last_name =>  "Hoyt",
  :primary_address =>  "32455 Capitola Ct",
  :alternate_address =>  "33691 Simple Ct",
  :city =>  "Union City",
  :zip_5 =>  "94587",
  :zip_4 =>  "1234",
  :state_province =>  "AB",
  :email =>  "jacki@proficientMD.com",
  :phone_home =>  "5104290790",
  :phone_mobile =>  "5105520948",
  :phone_work =>  "5105520948",
  :phone_fax =>  "5104290790",
  :phone_emergency =>  "5104290790",
  :date_of_birth =>  "19570902",
  :gender =>  "M",
  :ethnicity => "12")
pp2.save


pp3 = PatientProfile.create( 
  :pmd_patient_id => "100000003",
  :pmd_user_id => "100000003",
  :physician_id => "100000003",
  :first_name =>  "Whaky Jacky",
  :last_name =>  "Jacky",
  :primary_address =>  "32455 Capitola Ct",
  :alternate_address =>  "33691 Simple Ct",
  :city =>  "Union City",
  :zip_5 =>  "94587",
  :zip_4 =>  "1234",
  :state_province =>  "AB",
  :email =>  "wacky@proficientMD.com",
  :phone_home =>  "5104290790",
  :phone_mobile =>  "5105520948",
  :phone_work =>  "5105520948",
  :phone_fax =>  "5104290790",
  :phone_emergency =>  "5104290790",
  :date_of_birth =>  "19601030",
  :gender =>  "F",
  :ethnicity => "12")
pp3.save 

pp4 = PatientProfile.create( 
  :pmd_patient_id => "100000004",
  :pmd_user_id => "100000004",
  :physician_id => "100000004",
  :first_name =>  "Chris",
  :last_name =>  "Hoyt",
  :primary_address =>  "32455 Capitola Ct",
  :alternate_address =>  "33691 Simple Ct",
  :city =>  "Union City",
  :zip_5 =>  "94587",
  :zip_4 =>  "1234",
  :state_province =>  "AB",
  :email =>  "chris@proficientMD.com",
  :phone_home =>  "5104290790",
  :phone_mobile =>  "5105520948",
  :phone_work =>  "5105520948",
  :phone_fax =>  "5104290790",
  :phone_emergency =>  "5104290790",
  :date_of_birth =>  "19810709",
  :gender =>  "M",
  :ethnicity => "11")
pp4.save

pp5 = PatientProfile.create( 
  :pmd_patient_id => "111111111",
  :pmd_user_id => "111111111",
  :physician_id => "111111111",
  :first_name =>  "Scott",
  :last_name =>  "Wade",
  :primary_address =>  "3600 harbor",
  :alternate_address =>  "none",
  :city =>  "Oxnard",
  :zip_5 =>  "93035",
  :zip_4 =>  "1234",
  :state_province =>  "CA",
  :email =>  "scott@proficientMD.com",
  :phone_home =>  "5555555555",
  :phone_mobile =>  "5555555555",
  :phone_work =>  "5555555555",
  :phone_fax =>  "5555555555",
  :phone_emergency =>  "5555555555",
  :date_of_birth =>  "19810709",
  :gender =>  "M",
  :ethnicity => "10")
pp5.save
