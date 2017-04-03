module HomeHelper
  def search_extra_info(class_name)
    case class_name.class.name
      when 'Church'
        class_name.aka
      when 'Pastor'
        class_name.church.name
      when 'School'
        class_name.location
      when 'Lecturer'
        class_name.school.name
      when 'Politician'
        class_name.current_office
      when 'Brand'
        class_name.industry
      else
        class_name
    end
  end
end
