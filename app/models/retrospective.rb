class Retrospective < ActiveRecord::Base
  belongs_to :dojo
  
  validates_numericality_of :dojo_id
end
