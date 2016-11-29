class Carlin < Item
  def initialize
    @name = 'carlin'
    @description = nil
    @canTake = false
    @talked = false
  end

  def interaction
    if (!@talked)
      @talked = true
      puts '"A new face! Hello!"'
      puts 'a: Greetings.'
      puts 'b: Can you tell me about that door back there?'
      resp = gets.chomp
      case resp.downcase
      when 'a'
        puts '"Hello! Oh, I said that already."'
      when 'b'
        puts '"Rumor has it there is a nice treasure trove back there."'
        puts '"Of course you would need a key to unlock the door..."'
      else
        puts '"Carry on, then."'
      end
    else
      puts '"You want the treasure? Find the key."'
    end
  end

end
