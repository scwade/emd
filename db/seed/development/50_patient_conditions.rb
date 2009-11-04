#db/seed/development/patient_profiles.rb
#Development base data

# Initialize
treated_by = treat_notes = []
treated_by  << "Dr Wade" << "Dr Hoyt" << "Dr Smith" << "Dr Foot"
treat_notes << "No problem found" << "Continue treatment" << "Re-check in a month" << "No problem" 

# Delete all before seeding
PatientCondition.delete_all

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
