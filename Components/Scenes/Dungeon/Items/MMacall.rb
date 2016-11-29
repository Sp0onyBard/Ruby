class Macall < Item
  def initialize
    @name = 'macall'
    @description = nil
    @canTake = false
    @talked = false
  end

  def interaction
    if (!@talked)
    @talked = true
    puts '"Hello, how are you?"'
    puts 'a: I am well. Yourself?'
    puts 'b: What is this business about treasure hidden in down here?'
    resp = gets.chomp
    case resp.downcase
    when 'a'
      puts '"You realize I am locked in a dungeon?"'
    when 'b'
      puts '"Well, you need a key. Which the royal family hid somewhere."'
    else
      puts '"Just trying to make conversation."'
    end
   else
     puts '"Where you might find a key?"'
     puts '"...Have you tried paintings? Only because we tried everything else."'
   end
  end
end
  
   
    
    
  
