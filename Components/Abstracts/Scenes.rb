class Scene
  attr_accessor :name, :failCase
  def initialize(name)
    @name = name
    @items = Array.new
    @adjacent = nil
    @failCase = false
  end

  def setDes(des)
    @description = des
  end
  
  def look
    puts @description
  end
  
  def addOb(o)
    @items.push(o)
  end
  
  def getObject(o)
    ob = nil
    @items.each {|i|
      if (i.name == o)
        ob = i
        break
      end
    }
    ob
  end


  def addAdj(s)
    @adjacent.push(s)
  end

  def canMove(rname)
    ret = false
    @adjacent.each {|i|
      if (i == rname)
        ret = true
        break
      end}
    ret
  end
  
end
