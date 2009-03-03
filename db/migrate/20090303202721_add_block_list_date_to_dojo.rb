class AddBlockListDateToDojo < ActiveRecord::Migration
  def self.up
    add_column :dojos, :block_list_date, :datetime
  end

  def self.down
    remove_column :dojos, :block_list_date
  end
end
