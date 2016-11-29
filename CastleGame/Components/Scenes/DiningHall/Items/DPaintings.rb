class DPaintings < Item
  def initialize
    @name = 'paintings'
    @description = 'A collection of painstakingly detailed paintings.'
    @canTake = false
  end

  def interaction
    puts @description
    puts 'Take a closer look at the KING portrait, the CASTLE landscape, or the QUEEN portait?'
    resp = gets.chomp
    case resp.downcase
    when 'king'
      puts 'A portrait of an aged, armored man who seems to be grimacing.'
    when 'queen'
      puts 'A portrait of an aged woman in a puffy dress. She does not appear happy.'
    when 'castle'
      puts 'A painting of the castle when viewed from a hill in summertime.'
    else
      puts 'You look elsewhere.'
    end
  end

end

