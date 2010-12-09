class AddDisplaySubmissionsToTurkeeTasks < ActiveRecord::Migration
  def self.up
    add_column :turkee_tasks, :display_submissions, :boolean, :default => false
  end

  def self.down
    remove_column :turkee_tasks, :display_submissions
  end
end
