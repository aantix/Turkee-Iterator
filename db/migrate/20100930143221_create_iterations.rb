class CreateIterations < ActiveRecord::Migration
  def self.up
    create_table :iterations do |t|
      t.integer :parent_id
      t.string :value

      t.timestamps
    end
  end

  def self.down
    drop_table :iterations
  end
end
