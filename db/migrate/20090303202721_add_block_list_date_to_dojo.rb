class AddBlockListDateToDojo < ActiveRecord::Migration
  def self.up
    add_column :dojos, :block_list_date, :datetime
    Dojo.transaction do
      Dojo.find(:all).each do |d|
        d.update_attributes :block_list_date => d.date
      end
    end
  end

  def self.down
    remove_column :dojos, :block_list_date
  end
end
