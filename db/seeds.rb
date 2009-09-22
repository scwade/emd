# in db/seeds.rb
######                        This is the db Seed File                      ##############
# Place all Index's, application foundation configuration data, and create calls in here #
# Also describe each  block's purpose and reference of data source                       #
##########################################################################################
# TEMPLATE ####################
#require 'open-uri'
#require 'active_record/fixtures'

# def load_seed_files!
  seed_files = Dir["#{RAILS_ROOT}/db/seed/all/*.rb"] + Dir["#{RAILS_ROOT}/db/seed/#{RAILS_ENV}/*.rb"]
  seed_files.each do |file|
  puts "Loading seed file: #{file}"
  load(file)
  end
# end
# TEMPLATE ####################


User.create(:name => "training2", 
  :password => 'secret',
  :password_confirmation => 'secret')
