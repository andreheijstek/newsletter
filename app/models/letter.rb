class Letter < ActiveRecord::Base
  validates_presence_of :welcome, :date, :time1, :time2, :announcements
end
