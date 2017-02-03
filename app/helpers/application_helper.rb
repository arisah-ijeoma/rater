module ApplicationHelper
  def alert_color(name)
    case name
      when 'notice' then 'success'
      when 'alert' then 'danger'
      else name
    end
  end

  def show_devise(session, reg, psw)
    controller_name == session ||
    controller_name == reg ||
    controller_name == psw
  end
end
