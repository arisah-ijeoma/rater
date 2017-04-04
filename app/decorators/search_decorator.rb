class SearchDecorator

  def search_info(q)
    search_churches(q) + search_pastors(q) + search_school(q) + search_lecturers(q) + search_politicians(q) + search_brands(q)
  end

  private

  def search_churches(q)
    Church.where('LOWER(name) like ? OR LOWER(aka) like ?', *(["%#{q.downcase}%"] * 2))
  end

  def search_pastors(q)
    Pastor.where('LOWER(name) like ?', "%#{q.downcase}%")
  end

  def search_school(q)
    School.where('LOWER(name) like ? OR LOWER(aka) like ?', *(["%#{q.downcase}%"] * 2))
  end

  def search_lecturers(q)
    Lecturer.where('LOWER(name) like ?', "%#{q.downcase}%")
  end

  def search_politicians(q)
    Politician.where('LOWER(name) like ?', "%#{q.downcase}%")
  end

  def search_brands(q)
    Brand.where('LOWER(name) like ?', "%#{q.downcase}%")
  end
end
