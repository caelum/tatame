class CreateKatasTable < ActiveRecord::Migration
  def self.up
    create_table :katas do |t|
      t.string :title
      t.string :language
      t.text :description
      t.references :author, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :katas
  end
end
