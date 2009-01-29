class CreateRetrospectiveTable < ActiveRecord::Migration
  def self.up
    create_table :retrospectives do |t|
      t.string :problem
      t.string :code
      t.text :report
      t.text :retrospective
      t.text :parking_lot
      t.references :dojo
      t.timestamps      
    end
  end

  def self.down
    drop_table :retrospectives
  end
end
