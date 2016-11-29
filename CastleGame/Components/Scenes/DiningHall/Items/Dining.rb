class Dining < Item
  attr_accessor :number
  
  def initialize
    @name = 'diningware'
    @description = 'A few samples of a set of some silver utensils.'
    @number = 5
    @canTake = true
  end

  def interaction
    if ((@number - 1)>= 0)
      @number = @number - 1
      puts 'Looks like someone forgot to put away the utensils.'
      puts 'You take some, but they are scattered in a pile.'
      puts 'Thus, withdrawing some makes some noise...'
      if (@number == 0)
        @canTake = false
      end
    else
      puts 'You have probably taken enough.'
    end
  end

end

