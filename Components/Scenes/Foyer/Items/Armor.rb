class Armor < Item
  def initialize
    @name = 'armor'
    @description = 'Some fancy-looking armor. Quite heavy, too.'
    @canTake = false
  end

  def interaction
    puts @description
  end
end

