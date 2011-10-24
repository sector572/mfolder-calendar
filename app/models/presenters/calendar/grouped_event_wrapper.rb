class Presenters::Calendar::GroupedEventWrapper
  attr_reader :title
  attr_reader :events
  attr_accessor :event_lines


  def initialize(title, events = [])
    @title = title 
    @events = events
    @event_lines = []
  end

  def make_event_lines()
    sorted_event = @events.sort_by{|e| [e.start_day, -e.end_day.to_time.to_f]}#event_duration_in_calendar(@calendar_range)]}

   # event_lines = []
    sorted_event.each do |event|
      if(event_lines.length == 0)
        @event_lines << Presenters::Calendar::EventLine.new(event)
      else
        find = false
        @event_lines.each do |event_line|
          if(event_line.events.last.end_day < event.start_day)
            event_line.events << event
            find = true
            break
          end
        end
        if !find
         @event_lines << Presenters::Calendar::EventLine.new(event)
        end
      end

    end
     #next if (events.end_day < @calendar_range.first || @calendar_range.last > @end_date)
    #@event_lines = event_lines
  #      event_lines
  # end


    #  @grouped_event_wrapper.collect do |grouped_event|
    #grouped_event.events.collect do |event|
  end
end
