class User < ActiveRecord::Base
  acts_as_authentic :login_field_validates_uniqueness_of_options => {:message => 'There is an user already registered with this email'}
end
