class AddTestData < ActiveRecord::Migration
  def self.up
#    Condition.delete_all
    Condition.create(:pmd_patient_no => 1111,
      :start_date => 2009-01-01,
      :end_date => 2009-02-02,
      :treated_by => "Dr. Wade",
      :treat_notes =>
      %{<p>
        Treated with vitamin C
       </p>}),
       :name => "Aarskog Syndrome"
      

  end

  def self.down
    Condition.delete_all
  end
end
