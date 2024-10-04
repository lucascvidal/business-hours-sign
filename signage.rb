class Day
  attr_reader :name, :start_time, :end_time

  def initialize(name, start_time, end_time)
    @name = name
    @start_time = start_time
    @end_time = end_time
  end
end

class Signage
  attr_reader :list

  def initialize(list)
    @list = list
  end

  def pretty_list
    list.map do |day|
      "#{day.name}: #{day.start_time} - #{day.end_time}"
    end
  end
end
