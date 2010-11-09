class AddParentIdToIterations < ActiveRecord::Migration
  def self.up
    add_column :iterations, :parent_id, :integer
  end

  def self.down
    remove_column :iterations, :parent_id
  end
end
