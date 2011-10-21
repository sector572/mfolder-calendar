# coding: utf-8
class Test2Controller < ActionController::Base
  def index
    start_date = Date.new(2011, 12, 19)
    end_date = Date.new(2012, 01, 19)


grouped_events = []
grouped_events << Presenters::Calendar::GroupedEventWrapper.new("Супер мега мероприятие!!!!!!",
  [
    Presenters::Calendar::EventWrapper.new("Мероприятие 123", Date.new(2011, 12, 23), Date.new(2011, 12, 27)),
    Presenters::Calendar::EventWrapper.new("Встреча на высшем уровне", Date.new(2011, 12, 25), Date.new(2012, 01, 3)),
    Presenters::Calendar::EventWrapper.new("Встреча на высшем уровне1", Date.new(2012, 01, 4), Date.new(2012, 01, 25)),
    Presenters::Calendar::EventWrapper.new("Встреча на высшем уровне2", Date.new(2012, 01, 4), Date.new(2012, 01, 8)),
    Presenters::Calendar::EventWrapper.new("Встреча на высшем уровне3 ", Date.new(2012, 01, 10), Date.new(2012, 01, 14)),
    Presenters::Calendar::EventWrapper.new("Просто мероприятие", Date.new(2011, 12, 24), Date.new(2011, 12, 24))
  ])
grouped_events << Presenters::Calendar::GroupedEventWrapper.new("Еще одно мероприятие",
  [
    Presenters::Calendar::EventWrapper.new("Мероприятие 557", Date.new(2011, 12, 20), Date.new(2011, 12, 25))
  ])
grouped_events << Presenters::Calendar::GroupedEventWrapper.new("Презентация",
  [
    Presenters::Calendar::EventWrapper.new("Показ новых устройств", Date.new(2011, 12, 02), Date.new(2011, 12, 24))
  ])

@events_presenter = Presenters::EventsPresenter.new(start_date, end_date, grouped_events)





  end
end
