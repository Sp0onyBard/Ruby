class Diary < Item
  def initialize
    @name = 'diary'
    @description = 'There is a crude drawing of a heart. "On dungeon duty, give flowers from dining hall"'
    @canTake = true
  end

  def interaction
    puts @description
  end

end

