class AddNightToPerformances < ActiveRecord::Migration
  def self.up
    add_column :performances, :night, :boolean
  end

  def self.down
    remove_column :performances, :night
  end
end
