class RenameProblemsToRandoris < ActiveRecord::Migration
  def self.up
    rename_table :problems, :randoris
  end

  def self.down
    rename_table :randoris, :problems
  end
end
