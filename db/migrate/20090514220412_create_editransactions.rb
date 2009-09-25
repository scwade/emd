class CreateEditransactions < ActiveRecord::Migration
  def self.up
    create_table :editransactions do |t|
			t.column :isa01, :string, :limit=>2
			t.column :isa02, :string, :limit=>10
			t.column :isa03, :string, :limit=>2
			t.column :isa04, :string, :limit=>10
			t.column :isa05, :string, :limit=>2
			t.column :isa06, :string, :limit=>15
			t.column :isa07, :string, :limit=>2
			t.column :isa08, :string, :limit=>15
			t.column :isa09, :string, :limit=>6
			t.column :isa10, :string, :limit=>4
			t.column :isa11, :string, :limit=>1
			t.column :isa12, :string, :limit=>5
			t.column :isa13, :string, :limit=>9
			t.column :isa14, :string, :limit=>1
			t.column :isa15, :string, :limit=>1
			t.column :isa16, :string, :limit=>1
      t.timestamps
    end
  end

  def self.down
    drop_table :editransactions
  end
end
