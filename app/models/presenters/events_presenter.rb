# -*- encoding: utf-8

class Presenters::EventsPresenter
  def initialize(start_date, end_date, grouped_events_wrapper)
    @start_date = start_date || Date.today
    @end_date = end_date || Date.today
    @grouped_events_wrapper = grouped_events_wrapper || {}
  end
  

  def to_html
    [
      Presenters::Calendar::Header.new(_months, _days).to_html,
      Presenters::Calendar::Body.new(@grouped_events_wrapper, _days).to_html
    ].join.html_safe
  end


  # Вунтренние методы

  def _days
    @days ||= (@start_date..@end_date).collect { |day| Presenters::Calendar::DayWrapper.new(day) }
  end

  def _months
    return @_months if @_months

    h = Hash.new { |hash, key| hash[key] = [] }
    (@start_date..@end_date).each do |day|
      h[Date.new(day.year, day.month, 1)] << 1
    end
    
    @_months = h.map{|k,v| ::Presenters::Calendar::MonthWrapper.new(k, v.length)}
  end

end
