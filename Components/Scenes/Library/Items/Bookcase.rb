class Bookcase < Item
  def initialize
    @name = 'bookcase'
    @description = 'A single, tall, ornate bookcase filled with thick tomes. For the sake of stealth and ease, it would be best not to take one.'
    @canTake = false
  end

  def interaction
    puts @description
    puts 'Though, would you like a closer look at BOTANY, HISTORY of the Land, or BIOGRAPHY of King Elbert?'
    resp = gets.chomp
    case resp.downcase
    when 'botany'
      puts 'A bookmarked page reads,'
      puts '"Accidentally picked a bundle of Sweet Dreams, which, while pretty, induce a heavy sleep upon inhaling its scent."'
      puts '"However, His Majesty wanted the blooms around, making some comment about his rowdy children."'
      puts '"The Queen was not amused."'
    when 'history'
      puts 'This one is very thick, and the text is incredibly small. Best save it for some other time.'
    when 'biography'
      puts 'From the introduction:'
      puts '"His commitment to pacifism was a dividing point for many of the nobles and peasants."'
      puts 'More political drivel ahead.'
    else
      puts 'You look elsewhere.'
    end
  end

end
