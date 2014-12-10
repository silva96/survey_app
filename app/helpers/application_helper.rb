module ApplicationHelper
  def devise_message_to_twbs(message_type)
    if message_type == 'notice'
      type = "success"
    elsif message_type == 'alert'
      type = "danger"
    else
      type = message_type
    end
    return type
  end

end