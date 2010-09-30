class CreateIterationVotes < ActiveRecord::Migration
  def self.up
    create_table :iteration_votes do |t|
      t.integer :iteration_id

      t.timestamps
    end
  end

  def self.down
    drop_table :iteration_votes
  end
end
