class CreateReferenceAddresses < ActiveRecord::Migration
  def self.up
    create_table :reference_addresses do |t|
      t.string  :zip5,    :null=>false,   :limit=>5
      t.string  :state,   :null=>false,   :limit=>2
      t.string  :city,    :null=>false,   :limit=>60

      t.timestamps
    end
  end

  def self.down
    drop_table :reference_addresses
  end
end
