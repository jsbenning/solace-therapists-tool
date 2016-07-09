module Collectable
  
  def self.all
    @@all
  end
  
  @@all = Array.new
  
  def self.collect_all_forms(obj)
    @@all << obj
  end

  def collect
    Collectable.collect_all_forms(self)
  end
end
