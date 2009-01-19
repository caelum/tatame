class AddProblemType < ActiveRecord::Migration
  def self.up
    add_column :problems, :kata, :boolean
  end

  def self.down
    remove_column :problems, :kata
  end
end
