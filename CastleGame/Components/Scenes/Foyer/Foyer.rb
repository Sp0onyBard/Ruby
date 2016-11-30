#Load item files
require_relative 'Items/Armor.rb'
require_relative 'Items/FPaintings.rb'

class Foyer < Scene
  def initialize #Set items, adjacency, and description
    @name = 'foyer'
    @adjacent = ['dungeon', 'throne-room', 'dining-hall', 'entrance', 'library']
    @failCase = false
    @items = Array.new
    a = Armor.new
    fp = FPaintings.new
    addOb(a)
    addOb(fp)
    @description = 'A rather opulent gathering place. There are several metal plaques engraved with directions and the words: DUNGEON, THRONE-ROOM, DINING-HALL, ENTRANCE, LIBRARY. PAINTINGS are hung about, and suits of ARMOR stand in the hallways.'
  end

end

    
