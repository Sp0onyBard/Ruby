require_relative 'Items/Crown.rb'
require_relative 'Items/Throne.rb'
require_relative 'Items/TPaintings.rb'

class ThroneRoom < Scene
  def initialize
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

  def checkFail
    c = getObject('crown')
    c.taken
  end

end

