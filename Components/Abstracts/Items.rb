class Item
  attr_accessor :canTake, :name, :description
  
  def initialize(name, take)
    @name = name
    @description = nil
    @canTake = take
  end
  
  def examine
    interaction
  end
  
  def setDes(des)
    @description = des
  end
  
end
              
