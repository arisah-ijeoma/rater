module TagHelper
  def get_organization_url(tag)
    if action_name == 'edit'
      update_route(tag)
    else
      create_route
    end
  end

  def create_route
    if request.original_url.include?('/church')
      '/churches/tags'
    elsif request.original_url.include?('/pastor')
      '/churches/:church_id/pastors/tags'
    elsif request.original_url.include?('/school')
      '/schools/tags'
    elsif request.original_url.include?('/lecturer')
      '/schools/:school_id/lecturers/tags'
    elsif request.original_url.include?('/brand')
      '/brands/tags'
    elsif request.original_url.include?('/politician')
      '/politicians/tags'
    end
  end

  def update_route(tag)
    if request.original_url.include?('/church')
      "/churches/tags/#{tag.id}"
    elsif request.original_url.include?('/pastor')
      "/churches/:church_id/pastors/tags/#{tag.id}"
    elsif request.original_url.include?('/school')
      "/schools/tags/#{tag.id}"
    elsif request.original_url.include?('/lecturer')
      "/schools/:school_id/lecturers/tags/#{tag.id}"
    elsif request.original_url.include?('/brand')
      "/brands/tags/#{tag.id}"
    elsif request.original_url.include?('/politician')
      "/politicians/tags/#{tag.id}"
    end
  end

  def get_type(tag)
    if tag.type == 'ChurchTag'
      'churches'
    elsif tag.type == 'PastorTag'
      'pastors'
    elsif tag.type == 'SchoolTag'
      'schools'
    elsif tag.type == 'LecturerTag'
      'lecturers'
    elsif tag.type == 'BrandTag'
      'brands'
    elsif tag.type == 'PoliticianTag'
      'politicians'
    end
  end

  def sorted_tags(class_name)
    if class_name.tag.present?
      tags = class_name.tag.gsub!(/[^A-Za-z|,|]/, ' ').split(',')
      striped_tags = tags.map { |t| t.strip }
      sorted_tags = Hash.new(0)
      striped_tags.each do |v|
        sorted_tags[v] += 1
      end

      sorted_tags.sort_by { |k, v| -v }.map {|k,_| k }.first(20)
    end
  end
end
