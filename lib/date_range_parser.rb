class DateRangeParser
  attr_reader :range
  
  def initialize(range)
    @range = range
  end
  
  def parse(date_format: '%d/%m/%Y')
    range.split(' - ').map { |date| DateTime.strptime(date, date_format).in_time_zone }
  end
end
