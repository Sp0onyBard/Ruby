class Flowers < Item
  def initialize
    @name = 'flowers'
    @description = 'Pretty dark blue blooms.'
    @canTake = true
    @looked = false
  end

  def interaction
    if (!@looked)
      puts 'You obtain some flowers.'
      @looked = true
    else
      @canTake = false
      puts 'A handful of dark blue flowers sit in a vase.'
    end
  end
  
end
