class Editransaction < ActiveRecord::Base
	validates_presence_of :isa01, :isa02
#	validate :xxx
	
#	protected
#		def xxx
#			errors.add(:isa01, "should have something") if isa-1.nil?
#		end
end
