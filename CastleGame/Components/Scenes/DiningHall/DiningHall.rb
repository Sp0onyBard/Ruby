#Load item files
require_relative 'Items/Flowers.rb'
require_relative 'Items/Dining.rb'
require_relative 'Items/DPaintings.rb'

class DiningHall < Scene
  def initialize #Set up items, adjacency, and description.
    @name = 'dining-hall'
    @items = Array.new
    @adjacent = Array.new
    addAdj('foyer')
    f = Flowers.new
    d = Dining.new
    dp = DPaintings.new
    addOb(f)
    addOb(d)
    addOb(dp)
    @description = 'A long room occupied by a table that looks like it could seat thirty people. Perhaps more. Some DININGWARE is left at the head, and a pot of FLOWERS sits in the middle. Like the other rooms of the castle, it is decorated with PAINTINGS.'
    @failCase = true
  end

  def checkFail #If player has taken too many of the diningware object,
    forks = getObject('diningware') #trigger a game over.
    forks.number <= 0
  end

  
end

