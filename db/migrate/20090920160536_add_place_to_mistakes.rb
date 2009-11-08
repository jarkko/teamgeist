class AddPlaceToMistakes < ActiveRecord::Migration
  def self.up
    add_column :mistakes, :mistake_place_id, :integer, :null => false
    add_index :mistakes, :mistake_place_id
  end

  def self.down
    remove_index :mistakes, :mistake_place_id
    remove_column :mistakes, :mistake_place_id
  end
end
