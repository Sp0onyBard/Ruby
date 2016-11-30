class Item #General item class. All objects of class Item have these methods
  attr_accessor :canTake, :name, :description
  
  def initialize(name, take)
    @name = name
    @description = nil
    @canTake = take
  end
  
  def examine #Generally, display an object's information. However,
    interaction #behavior can vary between item objects, thus interaction
  end         #method is defined within each class inheriting from Item
  
  def setDes(des) #Change the object's description
    @description = des
  end
  
end
              
