#db/seed/development/xx_editransactions.rb
#Development base data

### ROLLAND TODO - Please make this a rake action (this was messing up my seed environments)
# Delete all before seeding
#Editransaction.delete_all

e1 = Editransaction.create(
  :isa01 => "11",
  :isa02 => "1234567890",
  :isa03 => "11",
  :isa04 => "1010101010",
  :isa05 => "11",
  :isa06 => "123456789012340",
  :isa07 => "11",
  :isa08 => "101010101010101",
  :isa09 => "123456",
  :isa10 => "1234",
  :isa11 => "1",
  :isa12 => "12345",
  :isa13 => "123456789",
  :isa14 => "1",
  :isa15 => "1",
  :isa16 => "1"
  )
e1.save

e2 = Editransaction.create(
  :isa01 => "12",
  :isa02 => "1234567890",
  :isa03 => "11",
  :isa04 => "2342134323",
  :isa05 => "11",
  :isa06 => "123524547435636",
  :isa07 => "11",
  :isa08 => "735335763276353",
  :isa09 => "123456",
  :isa10 => "1234",
  :isa11 => "1",
  :isa12 => "12345",
  :isa13 => "123456789",
  :isa14 => "1",
  :isa15 => "1",
  :isa16 => "1"
  )
e2.save

e3 = Editransaction.create(
  :isa01 => "31",
  :isa02 => "5050505050",
  :isa03 => "11",
  :isa04 => "2342134323",
  :isa05 => "11",
  :isa06 => "123456789012340",
  :isa07 => "11",
  :isa08 => "101010101010101",
  :isa09 => "123456",
  :isa10 => "1234",
  :isa11 => "1",
  :isa12 => "12345",
  :isa13 => "123456789",
  :isa14 => "1",
  :isa15 => "1",
  :isa16 => "1"
  )
e3.save

e4 = Editransaction.create(
  :isa01 => "14",
  :isa02 => "1234567890",
  :isa03 => "11",
  :isa04 => "2020202020",
  :isa05 => "11",
  :isa06 => "101010101010101",
  :isa07 => "11",
  :isa08 => "101010101010101",
  :isa09 => "123456",
  :isa10 => "1234",
  :isa11 => "1",
  :isa12 => "12345",
  :isa13 => "123456789",
  :isa14 => "1",
  :isa15 => "1",
  :isa16 => "1"
  )
e4.save
