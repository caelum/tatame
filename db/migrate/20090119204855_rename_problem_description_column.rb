class RenameProblemDescriptionColumn < ActiveRecord::Migration
  def self.up
    rename_column :problems, :comment, :description
  end

  def self.down
    rename_column :problems, :description, :comment
  end
end
