class Presenters::Calendar::Header
  include ActionView::Context
  include ActionView::Helpers::TagHelper
  
  def initialize(months, days)
    @months = Presenters::Calendar::Header::Months.new(months)
    @days = Presenters::Calendar::Header::Days.new(days)
  end

  def to_html
    content_tag('thead') do
      [
        _months_row,
        _days_row
      ].join.html_safe
    end
  end


  def _months_row
    content_tag('tr') do
    [
      content_tag('th', :rowspan => "2", :style => "width: 20%; height: 100%;") do
        content_tag('div', "", :class => "event_main_div")
      end,
      @months.to_html
    ].join.html_safe
    end
  end

  def _days_row
    content_tag('tr') do
      @days.to_html
    end
  end
end
