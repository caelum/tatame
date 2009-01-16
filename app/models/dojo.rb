class Dojo < ActiveRecord::Base
  validates_presence_of :date
  
  def self.next_date
     date = Dojo.find(:first, :conditions => ["date > ?", Time.now - 7.days], :order => "date DESC")
     
     if date == nil
       now = Time.now
       date = Time.utc(now.year, now.month, now.day, 19, 0)
     end
     date = date + 7.days
  end
end