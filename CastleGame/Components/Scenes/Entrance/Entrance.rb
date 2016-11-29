require_relative 'Items/Gate.rb'
require_relative 'Items/Wall.rb'
require_relative 'Items/SleepyGuard.rb'

class Entrance < Scene
  def initialize
    gate = Gate.new
    wall = Wall.new
    sg = SleepyGuard.new
    @adjacent = Array.new
    @name = 'entrance'
    @description = 'Entrance to the castle. A GATE looms overhead, a lone GUARD standing watch. The WALLs of the castle stand behind.'
    @items = Array.new
    @items.push(gate)
    @items.push(wall)
    @items.push(sg)
  end

  def use(dest, used)
    ret = false
    if dest == 'wall'
      if used == 'grappling-hook'
        @adjacent.push('foyer')
        puts 'You hooked the rope onto the window.'
        puts 'You can now move to the FOYER.'
        ret = true
      else
        puts 'Perhaps using another item would do better.'
      end
    else
      puts 'Not the place, nor the time for that...'
    end
    ret
  end
  

end
