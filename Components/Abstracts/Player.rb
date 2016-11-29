class Player
  def initialize
    @bag = Array.new
  end

  def takeItem(item)
    @bag.push(item)
  end

  def discItem(item)
    @bag.each{|i|
      if (i.name == item)
        @bag.delete(i)
        break
      end}
  end

  def showBag
    if (@bag.length == 0)
      puts 'You have nothing.'
    else
    @bag.each {|i|
      n = i.name
      puts n.upcase
      puts i.description}
    end
  end

  def inBag(iname)
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
