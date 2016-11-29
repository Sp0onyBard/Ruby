class DGuard < Item
  def initialize
    @name = 'guard'
    @canTake = false
    @description = nil
  end

  def interaction
    puts 'The guard is mumbling:'
    puts '"All I wanted was garden duty. Of course they assign me to this dark, smelly dungeon."'
    puts ''
    puts 'Looks like there is no way of moving past the guard without making contact. Perhaps it would be best to look elsewhere for now.'
  end

end

