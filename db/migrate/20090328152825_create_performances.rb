class CreatePerformances < ActiveRecord::Migration
  def self.up
    create_table :performances do |t|
      t.boolean :contest
      t.string :name
      t.date :date
      t.string :contest_type
      t.string :terrain_type
      t.string :place
      t.string :map
      t.string :scale
      t.decimal :length, :precision => 4, :scale => 4
      t.integer :time
      t.integer :position
      t.integer :control_amount
      t.integer :runner_amount
      t.integer :winning_time
      t.integer :priority
      t.integer :feeling
      t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :performances
  end
end
