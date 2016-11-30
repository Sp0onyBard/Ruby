#Load item files
require_relative 'Items/Crown.rb'
require_relative 'Items/Throne.rb'
require_relative 'Items/TPaintings.rb'

class ThroneRoom < Scene
  def initialize #Set items, adjacency, and description
    @name = 'throne-room'
    @failCase = true
    @items = Array.new
    c = Crown.new
    t = Throne.new
    tp = TPaintings.new
    addOb(c)
    addOb(t)
    addOb(tp)
    @adjacent = ['foyer']
    @description = 'A spacious room with PAINTINGS of grim people on either side. At the end is a large chair- the THRONE. On its seat is a CROWN.'
  end

  def checkFail #If the player takes the crown, the game ends. Crown object
    c = getObject('crown') #has a field that changes if the player takes it.
    c.taken
  end

end

