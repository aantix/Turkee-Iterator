class AddReturkToTurkeeTasks < ActiveRecord::Migration
  def self.up
    add_column :turkee_tasks, :returk, :boolean, :default => false
    add_column :turkee_tasks, :returk_top_x, :integer
  end

  def self.down
    remove_column :turkee_tasks, :returk_top_x
    remove_column :turkee_tasks, :returk
  end
end
