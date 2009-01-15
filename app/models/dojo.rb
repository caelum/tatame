class Dojo < ActiveRecord::Base
  validates_presence_of :date
  
  validate :date_must_be_after_today
  
  def date_must_be_after_today
    errors.add("date","can't be before today") unless (date != nil && date >= Time.now)
  end
end