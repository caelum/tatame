class AddTitleColumnToRetrospectiveTable < ActiveRecord::Migration
  def self.up
    add_column :retrospectives, :dojo_title, :string
  end

  def self.down
    remove_column :retrospectives, :dojo_title
  end
end
