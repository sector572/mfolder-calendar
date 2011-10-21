class Presenters::Calendar::Body::Events
  include ActionView::Context
  include ActionView::Helpers::TagHelper

  def initialize(days)
    #@days = days
  end


  def to_html
#    @days.collect do |x|
#      content_tag('th', :class => 'date_line3', :style => _col_style) do
#        content_tag('div', :class => 'date_line3') do
#          content_tag('div', x, :class => "date_header_column " + x.html_class)
#        end
#      end
#    end.join.html_safe
  end

end