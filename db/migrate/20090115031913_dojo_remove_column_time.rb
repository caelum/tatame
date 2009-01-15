class DojoRemoveColumnTime < ActiveRecord::Migration
  def self.up
    remove_column :dojos, :date
    remove_column :dojos, :time
    add_column :dojos, :date, :datetime
  end

  def self.down
    remove_column :dojos, :date
    add_column :dojos, :date, :date
    add_column :dojos, :time, :time
  end
end
