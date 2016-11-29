class Nate < Item
  def initialize
    @name = 'nate'
    @description = nil
    @canTake = false
    @talked = false
  end

  def interaction
    if (!@talked)
      @talked = true
      puts '"I am a very dangerous man."'
      puts 'a: Truly?'
      puts 'b: Nice. Talk to me about treasure.'
      resp = gets.chomp
      case resp.downcase
      when 'a'
        puts '"Are you being cheeky?"'
      when 'b'
        puts '"The stuff behind the locked door you mean?"'
        puts '"They say it belonged to the grandfather of the current king."'
      else
        puts '"They locked me up for good reason."'
      end
    else
      puts '"You want to know the owner of the treasure?"'
      puts '"Well, there are portraits of all the past kings in the throne room."'
      puts '"The current king does not have one up. Past kings."'
    end
  end

end
