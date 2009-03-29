class CreateMistakes < ActiveRecord::Migration
  def self.up
    create_table :mistakes do |t|
      t.integer :control
      t.integer :amount
      t.text :comments

      t.references :mistake_type
      t.references :performance
      t.timestamps
    end
  end

  def self.down
    drop_table :mistakes
  end
end
