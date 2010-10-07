class AddAllowVotingToTurkeeTasks < ActiveRecord::Migration
  def self.up
    add_column :turkee_tasks, :allow_voting, :boolean, :default => true
  end

  def self.down
    remove_column :turkee_tasks, :allow_voting
  end
end
