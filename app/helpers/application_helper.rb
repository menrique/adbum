module ApplicationHelper

  # Get bootstrap class based on message type
  def get_bootstrap_alert_class(message_type)
    case message_type
      when 'success'
        'alert-success'
      when 'error'
        'alert-danger'
      when 'warning'
        'alert-warning'
      else
        'alert-info'
    end
  end

  # Return URL from path
  def path_to_url(path)
    "#{request.protocol}#{request.host_with_port.sub(/:80$/,"")}/#{path.sub(/^\//,"")}"
  end

end
