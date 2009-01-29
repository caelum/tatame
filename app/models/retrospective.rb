class Retrospective < ActiveRecord::Base
  belongs_to :dojo
  
  validates_numericality_of :dojo_id
  
  def empty?
    attrs = attribute_names - ['id', 'dojo_id', 'created_at', 'updated_at']
    attrs.each do |attr|
      return false if send attr
    end
    return true
  end
  
end
