class Kata < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  
  validates_presence_of :title
  validates_presence_of :language
  validates_presence_of :author
end
