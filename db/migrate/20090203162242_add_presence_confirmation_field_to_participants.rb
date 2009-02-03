class AddPresenceConfirmationFieldToParticipants < ActiveRecord::Migration
  def self.up
    add_column :participants, :was_present, :boolean
  end

  def self.down
    remove_column :participants, :was_present
  end
end
