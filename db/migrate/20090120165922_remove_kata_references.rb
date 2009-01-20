class RemoveKataReferences < ActiveRecord::Migration
  def self.up
    remove_column :problems, :kata
  end

  def self.down
    add_column :problems, :kata, :boolean
  end
end
