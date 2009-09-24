# in db/seeds.rb
######                        This is the db Seed File                      ##############
# Place all Index's, application foundation configuration data, and create calls in here #
# Also describe each  block's purpose and reference of data source                       #
##########################################################################################
# TEMPLATE ####################
#require 'open-uri'
#require 'active_record/fixtures'

################  Auto Load all seed files by environment ################################
# def load_seed_files!

seed_files = Dir["#{RAILS_ROOT}/db/seed/all/*.rb"] + Dir["#{RAILS_ROOT}/db/seed/#{RAILS_ENV}/*.rb"]
# Sort by name so we run it in desire precidence (needed for many to many relationships)
seed_files_sorted = seed_files.sort_by { |seed_files| seed_files}

# Load seed file array from all seed directories
seed_files_sorted.each do |file|
  puts "Loading seed file: #{file}"
  load(file)
end


#end

#########################################################################################

