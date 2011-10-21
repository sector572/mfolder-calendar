class Presenters::Calendar::Body
  include ActionView::Context
  include ActionView::Helpers::TagHelper
  
  def initialize(grouped_event_wraper, days)
    @grouped_events = Presenters::Calendar::Body::GroupedEvents.new(grouped_event_wraper, days)
  end

  def to_html
    content_tag('tbody') do
      @grouped_events.to_html
    end.html_safe   
  end
end