class CreateParticipantsTable < ActiveRecord::Migration
  def self.up
    create_table :participants do |t|
        t.string  :name
        t.references :dojo
      end
  end

  def self.down
    drop_table :participants
  end
end
