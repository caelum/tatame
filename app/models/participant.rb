class Participant < ActiveRecord::Base
  belongs_to :dojo
  
  validates_presence_of :name
  validates_numericality_of :dojo_id
  
  default_value_for :name, 'Nome'
end
