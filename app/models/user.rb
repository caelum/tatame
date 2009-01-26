class User < ActiveRecord::Base
  validates_presence_of :email
  validates_uniqueness_of :email, :on => :create, :message => "There is an user already registered with this email"
  validates_presence_of :password
end
