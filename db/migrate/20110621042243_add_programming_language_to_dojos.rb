class AddProgrammingLanguageToDojos < ActiveRecord::Migration
  def self.up
    add_column :dojos, :programming_language, :string
  end

  def self.down
    remove_column :dojos, :programming_language
  end
end
