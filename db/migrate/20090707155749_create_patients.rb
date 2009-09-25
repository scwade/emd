#
 class CreatePatients < ActiveRecord::Migration
  def self.up
    create_table :patients, :force => true do |t|
#      t.integer :patient_condition_id
#      t.integer :condition_id
      t.string :blood_type

      t.timestamps
    end
  end

## Following lines are MySQL db foreign key constraints for conditions, patient_conditions
#    execute "alter table patients add constraint fk_patient_conditions foreign key (patient_condition_id) references patient_conditions(id)"
#    execute "alter table patients add constraint fk_patient_conditions foreign key (condition_id) references conditions(id)"

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



  def self.down
    drop_table :patients
  end
end

#  def self.up
#    create_table :patients2, :id => false, :force => true do |t|
#      t.column :patient_condition_id, :integer
#      t.column :condition_id, :integer
#      t.column :blood_type, :string
#    end

    # Migrate data and blank out blood type
#    ActiveRecord::Migration::execute("INSERT INTO patients2 (patient_condition_id, condition_id, blood_type) SELECT patient_condition_id, condition_id, 'none' FROM patients")

    # Copy temp table and replace patients table  
#    drop_table :patients
#    rename_table :patients2, :patients

#  end
  
#  def self.down
#    drop_table :patients
#  end
#end
