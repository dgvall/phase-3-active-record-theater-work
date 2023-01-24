class Role < ActiveRecord::Base
  has_many :auditions
  
  def actors
    arr = []
    self.auditions.map do |a|
      arr >> a.actor
    end
    arr
  end

  def locations
    arr = []
    self.auditions.map do |a|
      arr >> a.location
    end
  end

  def lead
    lead = self.auditions.where(hired: true).first

    if lead
      lead
    else "no actor has been hired for this role"
    end
  end

  def understudy
    understudy = self.auditions.where(hired: true).second

    if understudy
      understudy
    else "no actor has been hired for understudy for this role"
    end
  end

end