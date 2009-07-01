class ConditionUrlReference < ActiveRecord::Migration
  def self.up
    add_column :conditions, :google_url, :text
    add_column :conditions, :wiki_url, :text
  end

  def self.down
    remove_column :conditions, :google_url, :text
    remove_column :conditions, :wiki_url, :text
  end
end
