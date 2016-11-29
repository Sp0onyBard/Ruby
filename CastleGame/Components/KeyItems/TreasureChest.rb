class TreasureChest < Item
  def initialize
    @name = 'treasure-chest'
    @description = 'Riches once belonging to King Elbert.'
    @canTake = true
  end

  def interaction
    puts @description
  end

end

