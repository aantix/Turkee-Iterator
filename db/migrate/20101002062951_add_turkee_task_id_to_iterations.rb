class AddTurkeeTaskIdToIterations < ActiveRecord::Migration
  def self.up
    add_column :iterations, :turkee_task_id, :integer
  end

  def self.down
    remove_column :iterations, :turkee_task_id
  end
end
