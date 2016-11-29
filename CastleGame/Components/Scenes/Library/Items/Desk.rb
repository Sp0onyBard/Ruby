class Desk < Item
  attr_accessor :looked
  
  def initialize
    @name = 'desk'
    @description = 'A desk whose drawers are filled with an assortment of documents...oh? You obtain a DIARY.'
    @looked = false
    @canTake = false
  end

  def interaction
    if (!@looked)
      puts @description
      @description = 'A quill, an ink well, and some important-looking documents sit atop the desk.'
      puts @description
      @looked = true
    else
      puts @description
    end
  end

end

  
