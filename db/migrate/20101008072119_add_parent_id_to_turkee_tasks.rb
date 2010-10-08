class AddParentIdToTurkeeTasks < ActiveRecord::Migration
  def self.up
    add_column :turkee_tasks, :parent_id, :integer
  end

  def self.down
    remove_column :turkee_tasks, :parent_id
  end
end
