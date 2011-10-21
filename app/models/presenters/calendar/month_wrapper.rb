class Presenters::Calendar::MonthWrapper
  def initialize(month, days)
    @month = month
    @days = days
  end

  def days
    @days
  end

  def date
    @month
  end

  def name
    @month.strftime('%B')
  end
end
