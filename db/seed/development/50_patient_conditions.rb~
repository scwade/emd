#db/seed/development/patient_profiles.rb
#Development base data

c1 = Condition.find(1)
c2 = Condition.find(2)
c3 = Condition.find(3)

pp1 = PatientProfile.find(1)
pp1.conditions << c1
pc = pp1.patient_conditions
pc[0].start_date = "2009-06-18"
pc[0].end_date = "2009-06-18"
pc[0].treated_by = "Dr. Wang"
pc[0].treat_notes = "Treated with vitamin B"
pc[0].save

pp1.conditions << c2
pc = pp1.patient_conditions
pc[1].start_date = "2008-05-18"
pc[1].end_date = "2008-05-18"
pc[1].treated_by = "Dr. Wade"
pc[1].treat_notes = "Treated with vitamin C"
pc[1].save

pp1.conditions << c3
pc = pp1.patient_conditions
pc[2].start_date = "2009-05-18"
pc[2].end_date = "2009-04-18"
pc[2].treated_by = "Dr. Chao"
pc[2].treat_notes = "Treated with vitamin D"
pc[2].save

pp2 = PatientProfile.find(2)
pp2 = PatientProfile.find(2)
pp2.conditions << c1
pc = pp2.patient_conditions
pc[0].start_date = "2009-06-18"
pc[0].end_date = "2009-06-18"
pc[0].treated_by = "Dr. Wang"
pc[0].treat_notes = "Treated with vitamin B"
pc[0].save

pp2.conditions << c2
pc = pp2.patient_conditions
pc[1].start_date = "2008-05-18"
pc[1].end_date = "2008-05-18"
pc[1].treated_by = "Dr. Wade"
pc[1].treat_notes = "Treated with vitamin C"
pc[1].save

pp2.conditions << c3
pc = pp2.patient_conditions
pc[2].start_date = "2009-05-18"
pc[2].end_date = "2009-04-18"
pc[2].treated_by = "Dr. Chao"
pc[2].treat_notes = "Treated with vitamin D"
pc[2].save

## ROR console tests -- working
#------------------------------
#devpatientprofile1 = PatientProfile.find(422094565)
#devcondition1 = Condition.find(56)
#devpatientprofile1.conditions << devcondition1
#pc1 = devpatientprofile1.patient_conditions
#pc1[0].start_date = "2009-06-18"
#pc1[0].end_date = "2009-06-18"
#pc1[0].treated_by = "Dr. Wang"
#pc1[0].treat_notes = "Treated with vitamin B"


