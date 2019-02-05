module ApplicationHelper
  def flash_class(level)
    case level
      when 'notice' then "alert alert-info"
      when 'success' then "alert alert-success"
      when 'error' then "alert alert-danger"
      when 'alert' then "alert alert-warning"
    end
  end

  def parse_time(time)
    time.strftime("%I:%M%P")
  end

  def parse_date(date)
    date.strftime("%e %b %Y")
  end
end
