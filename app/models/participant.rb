class Participant < ActiveRecord::Base
  belongs_to :dojo
  
  validates_presence_of :name
  validates_numericality_of :dojo_id
end