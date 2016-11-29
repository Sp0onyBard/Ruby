class TPaintings < Item
  attr_accessor :lookKey, :foundKey
  def initialize
    @name = 'paintings'
    @description = 'Paintings of kings, arranged in chronological order, it would seem.'
    @canTake = false
    @lookKey = false
    @foundKey = false
  end

  def interaction
    puts @description
    puts 'Take a closer look at painting of King MARCUS, ROY, ELBERT, or ALEXANDER?'
    resp = gets.chomp
    case resp.downcase
    when 'marcus'
      puts 'A man draped in a regal blue outfit with a rapier in hand.'
    when 'roy'
      puts 'A man with unkempt hair who seems to favor a little more red in his outfit.'
    when 'elbert'
      puts 'A mustache-d man in robes similar to his predecessor, holding the same rapier.'
      if (@lookKey && !@foundKey)
        puts 'You reach behind the portrait to find... a key!'
        @foundKey = true
      end
    when 'alexander'
      puts 'A frowning man, again holding the rapier of the royal family. If you could guess his favorite color, it would be purple.'
    else
      puts 'You look elsewhere.'
    end
  end

end

