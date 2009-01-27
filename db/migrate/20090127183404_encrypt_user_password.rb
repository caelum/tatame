class EncryptUserPassword < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.remove :password
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
    end
  end

  def self.down
    change_table :users do |t|
      t.remove :crypted_password
      t.remove :password_salt
      t.remove :persistence_token
      t.string password
    end
  end
end
