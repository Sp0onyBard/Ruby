class Wall < Item
  def initialize
    @name = 'wall'
    @description = 'Walls of the castle... Is that an open window, ripe for the climbing?'
    @canTake = false
  end

  def interaction
    puts @description
  end

end
