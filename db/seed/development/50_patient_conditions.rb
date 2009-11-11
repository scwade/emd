#db/seed/development/xx_patient_conditions.rb
#Development base data

### ROLLAND TODO - Please make this a rake action (this was messing up my seed environments)
# Delete all before seeding
# PatientCondition.delete_all

# Initialize
treated_by = treat_notes = []
treated_by  << "Dr. Wade" << "Dr. Chao" << "Dr. Reeves" << "Dr. Madany" << "Dr. Wang"
treat_notes << "Placed on high dose of vitamin C" << "Placed on high dose of vitamin B" << "Placed on high dose of vitamin D" << "Reassess after referral" 

p = PatientProfile.all
c = Condition.all

# Each patient gets each condition once only
p.each do |pv|
  c.each do |cv|
    pv.patient_conditions.create(:condition_id => cv.id,
                                 :start_date   => 10.days.ago,
                                 :end_date     => 5.days.ago,
                                 :treated_by   => treated_by[rand(treated_by.count)],
                                 :treat_notes  => treat_notes[rand(treat_notes.count)] )
  end
end

# Scotts stuff
### ROR console tests -- working
##------------------------------
##devpatientprofile1 = PatientProfile.find(422094565)
##devcondition1 = Condition.find(56)
##devpatientprofile1.conditions << devcondition1
##pc1 = devpatientprofile1.patient_conditions
##pc1[0].start_date = "2009-06-18"
##pc1[0].end_date = "2009-06-18"
##pc1[0].treated_by = "Dr. Wang"
##pc1[0].treat_notes = "Treated with vitamin B"
#
#
