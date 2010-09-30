class AddFormBodyToTurkeeTasks < ActiveRecord::Migration
  def self.up
    add_column :turkee_tasks, :form_body, :string
  end

  def self.down
    remove_column :turkee_tasks, :form_body
  end
end
