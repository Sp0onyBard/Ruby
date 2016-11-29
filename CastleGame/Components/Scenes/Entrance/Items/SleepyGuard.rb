class SleepyGuard < Item
  def initialize
    @name = 'guard'
    @description = nil
    @canTake = false
    @talked = false
  end

  def interaction
    if (!@talked)
      puts '"Aha! Who goes there?"'
      puts '"a: No one."'
      puts '"b: (You stay quiet)"'
      resp = gets.chomp
      case resp.downcase
      when 'a'
        puts '"I know I saw something!"'
      when 'b'
        puts '"Huh. Must have imagined something."'
      else
        puts '"Man, I really need sleep."'
      end
    else
      puts 'He has fallen asleep while standing. Impressive.'
    end
  end

end

    
    
