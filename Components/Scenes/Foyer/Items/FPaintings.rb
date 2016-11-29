class FPaintings < Item
  def initialize
    @name = 'paintings'
    @canTake = false
    @description = 'Several awkward family pictures.'
  end

  def interaction
    puts @description
    puts 'Look closer at 4TH generation portrait, 3RD generation portrait, 2ND generation portrait, or FOUNDER portrait?'
    resp = gets.chomp
    case resp.downcase
    when '4th'
      puts 'The king and queen, seated, with the prince and princess making odd faces at each other in the background.'
    when '3rd'
      puts 'The king and queen seated with presumably a prince and two princesses standing behind.'
    when '2nd'
      puts 'The king and queen surrounded by five children.'
    when 'founder'
      puts 'An imposing, armored man with a sword in one hand and a scale in the other.'
    else
      puts 'You look elsewhere.'
    end
  end

end

