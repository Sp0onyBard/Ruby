class Player #Player class, holds items the player collects over the duration of
             #gameplay
  def initialize #Initialization, set bag to an empty array
    @bag = Array.new
  end

  def takeItem(item) #Add an item to the bag
    @bag.push(item)
  end

  def discItem(item) #Remove an item from the bag
    @bag.each{|i|
      if (i.name == item)
        @bag.delete(i)
        break
      end}
  end

  def showBag #Display the names and information of the bag's contents
    if (@bag.length == 0)
      puts 'You have nothing.'
    else
    @bag.each {|i|
      n = i.name
      puts n.upcase
      puts i.description}
    end
  end

  def inBag(iname)#Is an object of name iname in the bag? 
    ret = false
    if (@bag.length != 0)
    @bag.each {|i|
      if (i.name == iname)
        ret = true
        break
      end}
    end
    ret
  end
  
  
end
