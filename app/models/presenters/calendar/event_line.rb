# -*- encoding: utf-8

class Presenters::Calendar::EventLine
  attr_accessor :events

  def initialize(event)
    @events = []
    @events << event
  end
end