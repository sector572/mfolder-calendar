class Presenters::Calendar::DayWrapper
  attr_reader :day
  
  def initialize(day)
    @day = day
  end

  def holiday?
    @holiday ||= (@day.wday == 0 || @day.wday == 6)
  end

  def to_s
    @day.day.to_s.html_safe
  end

  def html_class
    holiday? ? 'rest_day' : 'work_day'
  end
end
