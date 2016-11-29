class SleepingGuard < Item
  attr_accessor :awoken
  
  def initialize
    @name = 'guard'
    @description = nil
    @canTake = false
    @awoken = false
  end

  def interaction
    puts 'The guard is snoring away...'
    puts 'a: Nudge him. Just for fun.'
    puts 'b: Leave him be.'
    resp = gets.chomp
    case resp.downcase
    when 'a'
      puts 'The guard awakens!'
      puts 'Upon seeing you, he dashes out of the room.'
      puts 'Voices can be heard from outside.'
      @awoken = true
    when 'b'
      puts 'He shifts, but otherwise remains asleep.'
    else
      puts 'You stare at his sleeping face for a moment.'
    end
  end

end
