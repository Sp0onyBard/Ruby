class Throne < Item
  def initialize
    @name = 'throne'
    @description = 'For a king, you might guess.'
    @canTake = false
  end

  def interaction
    puts @description
  end

end
