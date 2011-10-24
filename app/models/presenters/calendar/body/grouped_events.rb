class Presenters::Calendar::Body::GroupedEvents
  include ActionView::Context
  include ActionView::Helpers::TagHelper


  def initialize(grouped_event_wrapper, days)
    @grouped_event_wrapper = grouped_event_wrapper
    @calendar_range = (days.first.day)..(days.last.day)
    @days = days
  end


  def to_html
    @grouped_event_wrapper.each do |grouped_event|
      grouped_event.make_event_lines
    end

    @grouped_event_wrapper.collect do |grouped_event|
      grouped_event.event_lines.collect do |_event_line|
        content_tag('tr', :style => "white-space: nowrap;") do
          [
            event_title(grouped_event, _event_line),
            event_line_html(_event_line)
          ].join.html_safe
        end
      end.join.html_safe
    end.join.html_safe
  end

#  def to_html
#    @grouped_event_wrapper.collect do |grouped_event|
#      grouped_event.events.collect do |event|
#        content_tag('tr', :style => "white-space: nowrap;") do
#          [
#            event_title(grouped_event, event),
#            event_line(event)
#          ].join.html_safe
#        end
#      end.join.html_safe
#    end.join.html_safe
#  end

  #make_event_lines


  def event_title(grouped_event, _event_line)
    #return if (grouped_event.events.first != first_event)
    return if (grouped_event.event_lines.first != _event_line)

    content_tag('td', :class => "td_event", :rowspan => grouped_event.event_lines.length) do
      content_tag('div', :class => "event_main_div") do
        content_tag('div', grouped_event.title ,:class => "event_title", :title => grouped_event.title) 
      end
    end
  end


#  def event_line(event)
#    result = []
#    first = true

#    @days.collect do |d| 
#      if (!event.include?(d.day)) 
#        result << _blank_day(d)
#      else
#        next if !first
#        first = false
#        result << _render_event(event)
#      end
#    end
#    result.join
#  end

  def event_line_html(_event_line)
  event_line_index = 0
  cur_event = _event_line.events[event_line_index]


    result = []
    first = true

    @days.collect do |d| 
      if (!cur_event.include?(d.day)) 
        result << _blank_day(d)
      else
        if first
          first = false
          result << _render_event(cur_event)
        end
        if(cur_event.end_day == d.day)
          first = true
          event_line_index += 1
          if (_event_line.events.length > event_line_index)
            cur_event = _event_line.events[event_line_index] 
          end
        end
      end
    end
    result.join
  end



  def _blank_day(d)
    content_tag('td') do
      content_tag('div', :class => "date_line3") do
        content_tag('div', '&nbsp;'.html_safe, :class => "date_column #{d.html_class}") 
      end
    end
  end


  def _render_event(event)
    content_tag('td', :class => "td_task", :colspan => event.event_duration_in_calendar(@calendar_range)) do
      content_tag('div', :class => "date_line3") do
        content_tag('div', event.caption, :title => event.caption ,:class => event.html_class(@calendar_range)) 
      end
    end
  end



end
