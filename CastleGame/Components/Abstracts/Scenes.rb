class Scene #general scene class. All Scene objects have these methods
  attr_accessor :name, :failCase
  def initialize(name)#Default initialization, where everything is empty
    @name = name
    @items = Array.new
    @adjacent = nil
    @failCase = false
  end

  def setDes(des)#Change description of the scene 
    @description = des
  end
  
  def look #Display scene's information
    puts @description
  end
  
  def addOb(o) #Add an object to the scene
    @items.push(o)
  end
  
  def getObject(o) #Get an object by name
    ob = nil
    @items.each {|i|
      if (i.name == o)
        ob = i
        break
      end
    }
    ob
  end


  def addAdj(s) #Add the name of a scene to which the player can move from 
    @adjacent.push(s) #this one
  end

  def canMove(rname) #Can the player move to the scene whose name is rname?
    ret = false
    @adjacent.each {|i|
      if (i == rname)
        ret = true
        break
      end}
    ret
  end
  
end
