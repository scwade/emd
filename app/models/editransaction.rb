class Editransaction < ActiveRecord::Base
	validates_presence_of :isa01, :isa02, :isa03
  validates_numericality_of :isa01, :isa03
  validates_length_of :isa01, :maximum => 2, :message=> "Must be 2 characters"
#  validates_length_of :isa01, :minimum => 2, :too_short => "Must be 2 characters"
#  validates_uniqueness_of :isa01
#  Validation not currently applicable
#  validate :fieled_must_be_higher_than_zero
#  validates_associated :user

#data entry validation for UI
protected
		def fieled_must_be_higher_than_zero
			errors.add(:isa01, "should have number non zero ") if isa01.nil? || isa01 < 01
		end
end

#  Some validations for later
#  validates_format_of :image_url,
#                      :with    => %r{\.(gif|jpg|png)$}i,
#                      :message => 'must be a URL for GIF, JPG ' +
#                                  'or PNG image.'



