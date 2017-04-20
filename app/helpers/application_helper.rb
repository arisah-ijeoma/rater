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

  def rating_comment(rating)
    if rating >= 4.50
      'Awesome'
    elsif rating >= 4.00
      'Good'
    elsif rating >= 3.00
      'Average'
    elsif rating >= 2.00
      'Poor'
    else
      'Awful'
    end
  end

  def suggestion_list
    suggestion_list = Church.uniq.pluck(:name, :aka) +
                      School.uniq.pluck(:name, :aka) +
                      Pastor.uniq.pluck(:name) +
                      Lecturer.uniq.pluck(:name) +
                      Politician.uniq.pluck(:name) +
                      Brand.uniq.pluck(:name)
    suggestion_list.flatten.join(', ')
  end

  def avatar_tag(class_name, style=:full)
    if style == :tiny_thumb
      size = '32x32'
    elsif style == :mid_thumb
      size = '48x48'
    elsif style == :headshot
      size = '150x150'
    elsif style == :lil_big
      size = '250x250'
    else
      size = '64x64'
    end
    image_tag(avatar_path(class_name), class: 'img-responsive', size: size).html_safe
  end

  def avatar_path(class_name)
    if class_name && class_name.avatar.try(:file).present?
      class_name.avatar.url
    else
      'default_avatar.png'
    end
  end

  def like_message(likes, user, count, type)
    if likes.include?(user) && count == 1
      "<p id='like'>You like this #{type}</p>".html_safe
    elsif likes.include?(user) && count > 1
      "<p id='like'>You and #{likes.count - 1} more like this #{type}</p>".html_safe
    elsif !likes.include?(user) && count.present?
      "<p id='like'>#{likes.count} like(s) for this #{type}</p>".html_safe
    else
      '<p id="like"></p>'.html_safe
    end
  end
end
