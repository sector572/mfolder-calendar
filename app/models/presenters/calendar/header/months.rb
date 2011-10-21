class Presenters::Calendar::Header::Months
  include ActionView::Context
  include ActionView::Helpers::TagHelper

  def initialize(month_presenters)
    @presenters = month_presenters
  end

  def to_html
    @presenters.sort_by { |p| [p.date.year, p.date.month] }.collect do |p|
      content_tag('th', :colspan =>  p.days) do
        content_tag('div', :class => 'date_line3') do
          content_tag('div', :class => 'date_header_column') do
            p.name
          end
        end
      end
    end.join.html_safe
  end
end
