module ApplicationHelper
  def flash_class(level)
    case level
        when 'notice', 'success' then "alert alert-success alert-dismissible fade show"
        when 'alert', 'error' then "alert alert-danger alert-dismissible fade show"
    end
  end
end
