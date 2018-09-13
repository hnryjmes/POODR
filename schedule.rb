class Schedule
  def scheduled?(schedulable, starting, ending)
    puts "This #{schedulable.class} is " +
    "available #{starting} - #{ending}"
    false
  end
end

module Schedulable
  attr_writer :schedule

  def schedule
    @schedule ||= Schedule.new
  end

  def schedulable?(starting, ending)
    !scheduled?(starting - lead_days, ending)
  end

  def scheduled?(starting, ending)
    schedule.scheduled?(self, starting, ending)
  end

  # includers may override
  def lead_days
    0
  end
end

class Bicycle
  include Schedulable

  def lead_days
    1
  end
  # ...
end

require 'date'
starting = Date.parse("2019/09/04")
ending = Date.parse("2019/09/10")

b = Bicycle.new
puts b.schedulable?(starting, ending)
