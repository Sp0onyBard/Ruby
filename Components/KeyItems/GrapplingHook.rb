class GrapplingHook < Item
  def initialize
    @name = 'grappling-hook'
    @description = 'A hook and rope. Good for climbing.'
    @canTake = false
  end

  def interaction
    puts @description
  end

end

