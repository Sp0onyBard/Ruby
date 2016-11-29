class Crown < Item
  attr_accessor :taken
  
  def initialize
    @name = 'crown'
    @canTake = false
    @description = 'The royal crown, used by this family since its conception...'
    @taken = false
  end

  def interaction
    puts @description
    puts 'Take it?'
    puts 'y: yes'
    puts 'n: no'
    resp = gets.chomp
    case resp.downcase
    when 'y'
      puts 'You take the crown.'
      @canTake = true
      @taken = true
    when 'n'
      puts 'Left it alone.'
    else
      puts 'You take a step back.'
    end

  end
end
