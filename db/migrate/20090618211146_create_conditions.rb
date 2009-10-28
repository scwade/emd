class CreateConditions < ActiveRecord::Migration
  def self.up
    create_table :conditions do |t|
      t.string :name,      :null => false
      t.text   :google_url
      t.text   :wiki_url

      t.timestamps
    end
  end

#  execute "alter table condition_id add constraint fk_condition_id_condition
#          foreign key (condition_id) references condition(id)"

  def self.down
    drop_table :conditions
  end
end
