class Dojo < ActiveRecord::Base
  validates_presence_of :date
  validates_presence_of :time
end