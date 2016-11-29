class Key < Item
  def initialize
    @name = 'key'
    @description = 'A rusted key with an intricate floral design near the top.'
    @canTake = true
  end

  def interaction
    puts @description
  end

end

