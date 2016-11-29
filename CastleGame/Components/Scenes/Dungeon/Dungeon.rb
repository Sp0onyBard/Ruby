require_relative 'Items/CCarlin.rb'
require_relative 'Items/MMacall.rb'
require_relative 'Items/NNate.rb'
require_relative 'Items/DGuard.rb'
require_relative 'Items/Door.rb'

class Dungeon < Scene
  attr_accessor :flattered
  def initialize
    @name = 'dungeon'
    @description = 'A GUARD stands in front of you.'
    @items = Array.new
    g = DGuard.new
    addOb(g)
    @adjacent = ['foyer']
    @flattered = false
    @failCase = false
  end

  def give(rec, item)
    ret = false
    if !@flattered
      if rec == 'guard'
        if item == 'flowers'
          puts 'The guard blushes, then sniffs the flower...'
          puts '...And collapses, out cold.'         
          c = Carlin.new
          m = Macall.new
          n = Nate.new
          d = Door.new
          @items.pop
          addOb(c)
          addOb(m)
          addOb(n)
          addOb(d)
          @flattered = true
          @description = 'The guard is still on the dungeon floor. In front of you are three cells, each with a scrap of paper tied to the bars, reading: Cantankerous CARLIN, Mischievous MACALL, and Notorious NATE. Far in the back of the room, you can see a DOOR flanked by two lanterns.'
          puts @description
          ret = true
        else
          puts 'The guard makes an odd face at you.'
        end
      else
        puts '...Best not to do that now, methinks.'
      end
    else
      puts '...Best not to do that now, methinks.'
    end
    ret
  end

  def use(rec, item)
    ret = false
    if (rec == 'door' && item == 'key')
      puts 'The door is unlocked! You obtain a treasure chest!'
      d = getObject('door')
      d.unlocked = true
      d.setDes('Door to the treasure trove of the royal family.')
      ret = true
    else
      puts 'Try another item, perhaps?'
    end
    ret
  end
  

end
