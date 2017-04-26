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

  def like_pattern
    url = request.original_url

    if url.include?('pastor')
      'pastor'
    elsif url.include?('church')
      'church'
    elsif url.include?('lecturer')
      'lecturer'
    elsif url.include?('school')
      'school'
    elsif url.include?('brand')
      'brand'
    elsif url.include?('politician')
      'politician'
    end
  end

  def basic_like_message(likes, user, count, type)
    if likes.include?(user) && count == 1
      "<p id='like'>You like this #{type}</p>".html_safe
    elsif likes.include?(user) && count > 1
      "<p id='like'>You and #{likes.count - 1} more like this #{type}</p>".html_safe
    elsif !likes.include?(user) && count > 0
      "<p id='like'>#{likes.count} like(s) for this #{type}</p>".html_safe
    else
      '<p id="like"></p>'.html_safe
    end
  end

  def complex_like_message(likes, user, count, type)
    if likes.include?(user) && count == 1
      "<p class='mini-like' id='mini_like_#{type.class.name.downcase}_#{type.id}'>You like this person</p>".html_safe
    elsif likes.include?(user) && count > 1
      "<p class='mini-like' id='mini_like_#{type.class.name.downcase}_#{type.id}'>You and #{likes.count - 1} more like this person</p>".html_safe
    elsif !likes.include?(user) && count > 0
      "<p class='mini-like' id='mini_like_#{type.class.name.downcase}_#{type.id}'>#{likes.count} like(s) for this person</p>".html_safe
    else
      "<p class='mini-like' id='mini_like_#{type.class.name.downcase}_#{type.id}'></p>".html_safe
    end
  end

  def show_basic_heart(user, heart, type, _type)
    if user
      if heart.present?
         if heart.like?
            link_to '<i class="fa fa-heart" aria-hidden="true"></i>'.html_safe, send("#{type}_unlike_path", _type), class: 'hearted', remote: true, method: :put
          else
            link_to '<i class="fa fa-heart-o" aria-hidden="true"></i>'.html_safe, send("#{type}_like_path", _type), class: 'hearted', remote: true, method: :put
          end
      else
        link_to '<i class="fa fa-heart-o" aria-hidden="true"></i>'.html_safe, send("#{type}_like_path", _type), class: 'hearted', remote: true, method: :put
      end
    end
  end

  def show_complex_heart(user, heart, parent, type, _type, _type_2)
    if user
      if heart.present?
        if heart.like?
          link_to '<i class="fa fa-heart" aria-hidden="true"></i>'.html_safe, send("#{parent}_#{type}_unlike_path", _type, _type_2), class: "mini-hearted-#{_type_2.class.name.downcase}-#{_type_2.id} mini-hearted", remote: true, method: :put
        else
          link_to '<i class="fa fa-heart-o" aria-hidden="true"></i>'.html_safe, send("#{parent}_#{type}_like_path", _type, _type_2), class: "mini-hearted-#{_type_2.class.name.downcase}-#{_type_2.id} mini-hearted", remote: true, method: :put
        end
      else
        link_to '<i class="fa fa-heart-o" aria-hidden="true"></i>'.html_safe, send("#{parent}_#{type}_like_path", _type, _type_2), class: "mini-hearted-#{_type_2.class.name.downcase}-#{_type_2.id} mini-hearted", remote: true, method: :put
      end
    end
  end

  def table(t1, t2, t3, t4, t5, t6)
    url = request.original_url

    if url.include?('/pastor')
      UserPastorHeart.likes(t2)
    elsif url.include?('/church')
      UserChurchHeart.likes(t1)
    elsif url.include?('/lecturer')
      UserLecturerHeart.likes(t4)
    elsif url.include?('/school')
      UserSchoolHeart.likes(t3)
    elsif url.include?('/brand')
      UserBrandHeart.likes(t5)
    elsif url.include?('/politician')
      UserPoliticianHeart.likes(t6)
    end
  end

  def js_basic_hearted(type, _type)
    link_to '<i class="fa fa-heart" aria-hidden="true"></i>'.html_safe, send("#{type}_unlike_path", _type), class: 'hearted', remote: true, method: :put
  end

  def js_basic_unhearted(type, _type)
    link_to '<i class="fa fa-heart-o" aria-hidden="true"></i>'.html_safe, send("#{type}_like_path", _type), class: 'hearted', remote: true, method: :put
  end

  def js_complex_hearted(parent, type, _type, _type_2)
    link_to '<i class="fa fa-heart" aria-hidden="true"></i>'.html_safe, send("#{parent}_#{type}_unlike_path", _type, _type_2), class: "mini-hearted-#{_type_2.class.name.downcase}-#{_type_2.id} mini-hearted", remote: true, method: :put
  end

  def js_complex_unhearted(parent, type, _type, _type_2)
    link_to '<i class="fa fa-heart-o" aria-hidden="true"></i>'.html_safe, send("#{parent}_#{type}_like_path", _type, _type_2), class: "mini-hearted-#{_type_2.class.name.downcase}-#{_type_2.id} mini-hearted", remote: true, method: :put
  end

  def check_website(class_name)
    class_name.website == 'http://' || class_name.website == 'https://'
  end
end
