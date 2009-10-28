#db/seed/development/conditions.rb
#Development base data

# Delete all before seeding
Condition.delete_all

c1 = Condition.create(:name => 'Abdominal Hernia',
  :google_url => "https://health.google.com/health/ref/Hernia",
  :wiki_url => "http://wiki.answers.com/Q/Special:Search&search=have%2Babdominal%2Bhernia&limitn=old")
c1.save
  
c2 = Condition.create(:name =>  'Aase Syndrome',
  :wiki_url => "http://wiki.answers.com/Q/Special:Search&search=have%2Baase%2Bsyndrome&limitn=old")
c2.save
  
c3 = Condition.create(:name => 'Abdominal Aortic Aneurysm (AAA)',
  :wiki_url => "http://wiki.answers.com/Q/Special:Search&search=have%2Baortic%2Baneurysm&limitn=old")
c3.save
  
c4 = Condition.create(:name =>'Abdominal Bloating',
  :wiki_url => "http://wiki.answers.com/Q/Special:Search&search=have%2Babdominal%2Bbloatingm&limitn=old")
c4.save
  
c5 = Condition.create(:name => 'Abdominal Cramps', 
  :wiki_url => "http://wiki.answers.com/Q/Special:Search&search=have%2Babdominal%2Bcramps&limitn=old")
c5.save
  
c6 = Condition.create(:name => 'Abdominal Mass',
  :wiki_url => "http://wiki.answers.com/Q/Special:Search&search=have%2Babdominal%2Bmass&limitn=old")
c6.save  

c7 = Condition.create(:name => 'Abdominal Pain',
  :wiki_url => 'http://wiki.answers.com/Q/Special:Search&search=have%2Babdominal%2Bpain&limitn=old')
c7.save
 
# Mouth Ulcers
# https://health.google.com/health/ref/Mouth+ulcers
# http://www.answers.com/topic/oral-ulcer
