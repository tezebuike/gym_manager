module ApplicationHelper
  def flash_class(level)
    case level
        when 'notice', 'success' then "alert alert-success alert-dismissible fade show"
        when 'alert', 'error' then "alert alert-danger alert-dismissible fade show"
    end
  end

  def status_class(status)
    case status
        when 'active' then "d-sm-inline-block btn btn-sm btn-success"
        when 'paused' then "d-sm-inline-block btn btn-sm btn-warning"
        when 'completed' then "d-sm-inline-block btn btn-sm btn-secondary"
        when 'deactivated' then "d-sm-inline-block btn btn-sm btn-danger"
    end
  end
end
