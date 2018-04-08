module ApplicationHelper
  def status_converter(status, truthy: 'Active', falsey: 'Pending')
    if status
      truthy
    else
      falsey
    end
  end

  def time_ago time
    "#{time_ago_in_words(time)} ago"
  end

  def double_digit_number n
    '%02d' % n
  end

  def flash_class(level)
    case level
      when 'notice' then "alert alert-info"
      when 'success' then "alert alert-success"
      when 'error' then "alert alert-danger"
      when 'alert' then "alert alert-warning"
    end
  end
end
