class AddReturkFormBodyToTurkeeTasks < ActiveRecord::Migration
  def self.up
    add_column :turkee_tasks, :returk_form_body, :string
  end

  def self.down
    remove_column :turkee_tasks, :returk_form_body
  end
end
