class Presenters::Calendar::GroupedEventWrapper
  attr_reader :title
  attr_reader :events
  attr_accessor :event_lines


  def initialize(title, events = [])
    @title = title 
    @events = events
  end
end
