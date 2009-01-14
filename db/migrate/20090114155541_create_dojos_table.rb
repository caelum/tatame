class CreateDojosTable < ActiveRecord::Migration
  def self.up
    create_table :dojos do |t|
        t.string  :title
        t.date :date
        t.time :time
        
        t.timestamps
      end
  end

  def self.down
    drop_table :dojos
  end
end
