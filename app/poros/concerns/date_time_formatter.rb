module DateTimeFormatter
  def date_formatter(date_time)
    Time.at(date_time)
  end

  def time_formatter(time)
    time = time.split(":")
    "#{time[0]} hours, #{time[1]} minutes"
  end
end