#db/seed/development/patient_profiles.rb
#Development base data

# Initialize
treated_by = treat_notes = []
treated_by  << "Dr Wade" << "Dr Hoyt" << "Dr Smith" << "Dr Foot"
treat_notes << "No problem found" << "Continue treatment" << "Re-check in a month" << "No problem" 

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
