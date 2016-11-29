require_relative 'Items/SleepingGuard.rb'
require_relative 'Items/Bookcase.rb'
require_relative 'Items/Desk.rb'

class Library < Scene
  def initialize
    @name = 'library'
    @description = 'The walls are lined with BOOKCASEs. A DESK is placed to the right, in front of a window. A GUARD is snoring away in a cushioned chair in the middle of the room.'
    @failCase = true
    s = SleepingGuard.new
    b = Bookcase.new
    d = Desk.new
    @items = Array.new
    @adjacent = ['foyer']
    addOb(s)
    addOb(b)
    addOb(d)
  end

  def checkFail
    guard = getObject('guard')
    guard.awoken
  end
  

end

