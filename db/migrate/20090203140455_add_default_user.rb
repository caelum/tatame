class AddDefaultUser < ActiveRecord::Migration
  def self.up
    password = ""
    chars = ("a".."z").to_a
    8.times do
      password << chars[rand(chars.size-1)]    end
    User.new(:email => 'dojoroot@caelum.com.br', :password => password, :password_confirmation => password).save
    puts "Login: dojoroot@caelum.com.br"
    puts "Password: #{password}"
  end

  def self.down
  end
end
