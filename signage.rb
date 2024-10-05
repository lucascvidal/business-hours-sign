require 'date'

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
    sorted_days = sort_days(@list)
    grouped_days = group_days_by_time(sorted_days)
    format_grouped_days(grouped_days)
  end

  private

  def sort_days(days)
    days_of_week = Date::DAYNAMES.rotate(1)
    days.sort_by { |day| days_of_week.index(day.name) }
  end

  def group_days_by_time(sorted_days)
    sorted_days.slice_when do |prev, curr|
      "#{prev.start_time} - #{prev.end_time}" != "#{curr.start_time} - #{curr.end_time}"
    end
  end

  def format_grouped_days(grouped_days)
    grouped_days.map do |group|
      format_days(group.map(&:name), "#{group.first.start_time} - #{group.first.end_time}")
    end
  end

  def format_days(days, time_range)
    if days.size > 2
      "#{days.first} - #{days.last}: #{time_range}"
    elsif days.size == 2
      "#{days.join(', ')}: #{time_range}"
    else
      "#{days.first}: #{time_range}"
    end
  end
end
