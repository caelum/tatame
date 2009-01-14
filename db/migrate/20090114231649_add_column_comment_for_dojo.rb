class AddColumnCommentForDojo < ActiveRecord::Migration
  def self.up
    add_column :dojos, :comment, :text
  end

  def self.down
    remove_column :dojos, :comment
  end
end
