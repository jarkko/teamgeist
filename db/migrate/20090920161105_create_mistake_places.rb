class CreateMistakePlaces < ActiveRecord::Migration
  def self.up
    create_table :mistake_places do |t|
      t.string :description
      t.string :abbreviation

      t.timestamps
    end
  end

  def self.down
    drop_table :mistake_places
  end
end
