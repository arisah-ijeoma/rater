class TagDecorator
  def initialize(url)
    @url = url
  end

  def new_tag
    if @url.include?('/pastor')
      PastorTag.new
    elsif @url.include?('/church')
      ChurchTag.new
    elsif @url.include?('/lecturer')
      LecturerTag.new
    elsif @url.include?('/school')
      SchoolTag.new
    elsif @url.include?('/brand')
      BrandTag.new
    elsif @url.include?('/politician')
      PoliticianTag.new
    end
  end

  def create_tag(params)
    if @url.include?('/pastor')
      PastorTag.new(params)
    elsif @url.include?('/church')
      ChurchTag.new(params)
    elsif @url.include?('/lecturer')
      LecturerTag.new(params)
    elsif @url.include?('/school')
      SchoolTag.new(params)
    elsif @url.include?('/brand')
      BrandTag.new(params)
    elsif @url.include?('/politician')
      PoliticianTag.new(params)
    end
  end
end
