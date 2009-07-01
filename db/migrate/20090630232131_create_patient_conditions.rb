class CreatePatientConditions < ActiveRecord::Migration
  def self.up
    create_table :patient_conditions do |t|
      t.integer :pmd_patient_no
      t.string :condition_name
      t.date :start_date
      t.date :end_date
      t.string :treated_by
      t.text :treat_notes

      t.timestamps
    end
  end

  def self.down
    drop_table :patient_conditions
  end
end
