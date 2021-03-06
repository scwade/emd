class CreatePatientConditions < ActiveRecord::Migration
  def self.up

    create_table :patient_conditions do |t|
      t.integer :patient_profile_id
      t.integer :condition_id
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

########################  Make this code into a Plugin ###############################
      # Example call:
      # add_fk_constraint 'orders','advertiser_id','advertisers','id'
      # "If you want add/alter a 'orders' record, then its 'advertiser_id' had
      #   better point to an existing 'advertisers' record with corresponsding 'id'"
#      def add_fk_constraint(table_name, referencing_col, referenced_table, referenced_col)
#        fk_name = "#{table_name}_#{referencing_col}"
#        sql = <<-ENDSQL
#          ALTER TABLE #{table_name}
#            ADD CONSTRAINT #{fk_name}
#            FOREIGN KEY (#{referencing_col}) REFERENCES #{referenced_table} (#{referenced_col})
#            ON UPDATE NO ACTION ON DELETE CASCADE; 
#          CREATE INDEX fki_#{fk_name} ON #{table_name}(#{referencing_col});
#        ENDSQL
#        execute sql
#      end
########################  Make this code into a Plugin ###############################
