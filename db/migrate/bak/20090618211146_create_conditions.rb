class CreateConditions < ActiveRecord::Migration
  def self.up
    create_table :conditions do |t|
#      t.string :name
      t.integer :pmd_patient_no
      t.date :start_date
      t.date :end_date
      t.string :treated_by
      t.text :treat_notes

      t.timestamps
    end
  end

  def self.down
    drop_table :conditions
  end
end
