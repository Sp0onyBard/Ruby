class Gate < Item
  def initialize
    @name = 'gate'
    @description = 'Tall and imposing. No use trying to enter through it.'
    @canTake = false
  end

  def interaction
    puts @description
  end

end
