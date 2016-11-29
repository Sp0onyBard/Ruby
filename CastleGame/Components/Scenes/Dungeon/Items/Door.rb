class Door < Item
  attr_accessor :unlocked
  def initialize
    @name = 'door'
    @description = 'A mysterious door. Would that you had a key! Or do you?'
    @canTake = false
    @unlocked = false
  end

  def interaction
    puts @description
  end

end
