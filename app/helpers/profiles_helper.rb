module ProfilesHelper
  def profile_picture_tag(profile, style=:full)
    if style == :tiny_thumb
      size = '32x32'
    elsif style == :mid_thumb
      size = '48x48'
    elsif style == :headshot
      size = '150x150'
    else
      size = '64x64'
    end
    image_tag(profile_picture_path(profile), size: size).html_safe
  end

  def profile_picture_path(profile)
    if profile && profile.profile_picture.try(:file).present?
      profile.profile_picture.url
    else
      'default_avatar.png'
    end
  end
end
