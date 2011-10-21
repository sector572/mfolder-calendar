class Presenters::Calendar::EventWrapper
  attr_reader :caption
  attr_reader :start_day
  attr_reader :end_day


  def initialize(caption, start_day, end_day)
    @caption = caption
    @start_day = start_day
    @end_day = end_day
  end


  def html_class(calendar)
    result = "task"
    result << " task_start_in_range" if (calendar.first <= start_day)
    result << " task_end_in_range" if (calendar.last >= end_day)
    result
  end


  def event_duration_in_calendar(calendar_range)
    (
      (
        end_day < calendar_range.last ? end_day : calendar_range.last
      ) - (
        start_day > calendar_range.first ? start_day : calendar_range.first
      )
    )  + 1 
  end


  def include?(day)
    @period ||= start_day..end_day    
    @period.include? (day)
  end
end
