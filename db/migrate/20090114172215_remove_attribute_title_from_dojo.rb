class RemoveAttributeTitleFromDojo < ActiveRecord::Migration
  def self.up
  	remove_column :dojos, :title
  end

  def self.down
  	add_column :dojos, :title, :string
  end
end
