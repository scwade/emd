class AddOpenidIdentifierToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :open_identifiers, :string
  end

  def self.down
    remove_column :users, :open_identifiers
  end
end
