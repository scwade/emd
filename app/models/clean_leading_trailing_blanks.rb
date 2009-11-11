class CleanLeadingTrailingBlanks 
 
  # Use * to coalesce attributes into a single array
  def initialize(*attributes)
    @attributes = attributes
  end

  # Remove leading/trailing blanks
  def before_validation(model)
    @attributes.each do |attribute|
      model[attribute].squish! unless model[attribute].blank?
    end
  end
end

