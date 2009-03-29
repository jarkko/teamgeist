class CreateMistakeTypes < ActiveRecord::Migration
  def self.up
    create_table :mistake_types do |t|
      t.string :name
      t.string :abbreviation

      t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :mistake_types
  end
end
