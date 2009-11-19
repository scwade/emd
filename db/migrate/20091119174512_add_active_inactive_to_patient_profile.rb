class AddActiveInactiveToPatientProfile < ActiveRecord::Migration
  def self.up
    add_column :patient_profiles, :active_patient, :boolean, :default => false, :null => false
  end

  def self.down
    remove_column :patient_profiles, :active_patient
  end
end
