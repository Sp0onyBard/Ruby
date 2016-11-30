#Loading files here
load 'Components/Abstracts/Scenes.rb'
load 'Components/Abstracts/Items.rb'
load 'Components/Abstracts/Player.rb'

load 'Components/Scenes/Entrance/Entrance.rb'
load 'Components/Scenes/Foyer/Foyer.rb'
load 'Components/Scenes/ThroneRoom/ThroneRoom.rb'
load 'Components/Scenes/DiningHall/DiningHall.rb'
load 'Components/Scenes/Library/Library.rb'
load 'Components/Scenes/Dungeon/Dungeon.rb'

load 'Components/KeyItems/GrapplingHook.rb'
load 'Components/KeyItems/Diary.rb'
load 'Components/KeyItems/Key.rb'
load 'Components/KeyItems/TreasureChest.rb'



class CastleGame
  def initialize #Initialize scenes and player object
    en = Entrance.new
    f = Foyer.new
    tr = ThroneRoom.new
    dh = DiningHall.new
    l = Library.new
    d = Dungeon.new
    @scenes = Array.new
    @scenes.push(en)
    @scenes.push(f)
    @scenes.push(tr)
    @scenes.push(dh)
    @scenes.push(l)
    @scenes.push(d)
    @player = Player.new
    gh = GrapplingHook.new
    @player.takeItem(gh)
    @done = false
  end

  def startGame #Display introduction text and set Entrance as currentScene
    @currentScene = getScene('entrance')
    puts 'The night is young and the castle sleeps... And you?'
    puts 'You imagine a treasure ripe for the pillaging!'
    puts '...'
    puts '(type help-RET for how to play)'
    puts '...'
    puts 'You stand at the entrance of the castle.'
    @currentScene.look
    play
  end

  def play #Loop for playing game and taking user input
    while (!@done)
    puts '...'
    puts 'What ever shall you do?'
    act = gets.chomp
    actargs = act.split(" ")
    case actargs[0]
    when 'look'
      @currentScene.look
    when 'examine'
     examination(actargs)
    when 'move'
     move(actargs)
    when 'bag'
      @player.showBag
    when 'give'
      gift(actargs)
    when 'use'
      usage(actargs)
    when 'help'
      showHelp
    else
      puts 'Sorry, come again?'
    end
    senseFailures    #senseFailures will change the done variable if needed
    end
    puts 'Game Over.' #Once exit loop, show items player has taken
    puts 'Your spoils:'
    @player.showBag
  end

  def getScene(sname) #Get a scene by name
    sc = nil
    @scenes.each {|i|
      if (i.name == sname)
        sc = i
        break
      end}
    sc
  end

  def showHelp #Help message. Game instructions and a few hints
    puts '~~~'
    puts 'COMMANDS:'
    puts 'MOVE: move dest'
    puts 'Change the current scene.'
    puts ''
    puts 'LOOK: look'
    puts 'Show description of the current scene.'
    puts ''
    puts 'EXAMINE: examine item-name'
    puts 'Get a description of an item.'
    puts 'Perhaps you might find another item!'
    puts 'If not given an item-name, you will be prompted for one.'
    puts ''
    puts 'BAG: bag'
    puts 'Show the contents of your bag and their descriptions.'
    puts ''
    puts 'GIVE: give recipient item'
    puts 'Remove an item from bag and give it to another character.'
    puts ''
    puts 'USE: use target item'
    puts 'Use an item. For example, use a key on a door...'
    puts ''
    puts 'HELP: help'
    puts 'Show this help message'
    puts '~~~'
    puts 'y for additional hints, RETURN to resume play'
    resp = gets.chomp
    if (resp == 'y')
      puts '~~~'
      puts 'Item names are capitalized, i.e. The room contained a CHAIR.'
      puts 'You can say "examine chair" to get a description of the chair.'
      puts '~~~'
      puts 'Basically any name that you can examine, give, or use is capitalized.'
      puts '~~~'
      puts 'Try talking to NPCs more than once.'
      puts '~~~'
      puts 'Be certain you have the object before you try using or giving it.'
      puts '~~~'
      puts 'End the game by returning to the entrance.'
      puts '~~~'
    else
      puts '~~~'
    end
  end

  def examination(s) #Get an object's information. The user input is passed in 
    if (s.length > 0)#as s. Checks if object exists. If it does, displays its
       ob = @currentScene.getObject(s[1]) #information.
       if (ob != nil)
         libCase(ob)
         ob.examine
         if (ob.canTake)
           @player.takeItem(ob)
         end
         getKey(ob)
       else
         puts 'Nothing of import there...'
       end
      else
        puts 'Examine what?'
        obn = gets.chomp
        ob = @currentScene.getObject(obn)
        if (ob != nil)
          libCase(ob)
          ob.examine
          if (ob.canTake)
            @player.takeItem(ob)
          end
          getKey(ob)
        else
          puts 'Nothing of import here...'
        end
     end
  end

  def move(s) #Change the current Scene. User input is s. If s exists, move to
    if (s.length > 1) #it. If s is the entrance, ask if user wishes to end 
        if (@currentScene.canMove(s[1].downcase))#game
          dest = getScene(s[1].downcase)
          if (dest.name == 'entrance')
            puts 'Would you like to leave the castle?'
            puts 'y: yes'
            puts 'n: no'
            resp = gets.chomp
            case resp.downcase
            when 'y'
              @done = true
              puts 'You remove yourself from the premises.'
            when 'n'
            end
          else
            @currentScene = dest
            @currentScene.look
          end
        else
          puts 'Cannot go there from here.'
        end
      else
        puts 'Move where?'
        dname = gets.chomp
        if (@currentScene.canMove(dname.downcase))
          dest = getScene(dname.downcase)
          if (dest.name == 'entrance')
            puts 'Would you like to leave the castle?'
            puts 'y: yes'
            puts 'n: no'
            resp = gets.chomp
            case resp.downcase
            when 'y'
              done = true
              puts 'You remove yourself from the premises.'
            when 'n'
            end
          else
            @currentScene = dest
            @currentScene.look
          end
          @currentScene = dest
          @currentScene.look
        else
          puts 'Cannot go there from here.'
        end
    end
  end

  def gift(s) #Give an item to another character. User input is s.
    if (@currentScene.respond_to?('give'))#If player object has the item
        if (s.length == 3 && @player.inBag(s[2]))#and the current scene has a 
          if (@currentScene.give(s[1], s[2]))   #give method, remove object
            @player.discItem(s[2])              #from bag. Give is implemented
            dunCase                             #in the scene. Also check for 
          end                                   #a case in which current scene
        else                                    #is the dungeon.
          puts 'Give command has form: give recipient item'
        end
      else
        puts 'Not the place for that...'       
    end
  end

  def usage(s)#Use an item on another item. User input is s. If player has the 
     if (@currentScene.respond_to?('use'))#item being used, and current Scene
        if (s.length == 3 && @player.inBag(s[2]))#has a use method, remove 
          if (@currentScene.use(s[1], s[2])) #object from bag. Also check for 
            @player.discItem(s[2]) #a case in which current Scene is the dungeon
            doorCase(s[1])
          end
        else
          puts 'Use command has form: use target item-used'
        end
      else
        puts 'Not the place for that...'
     end
  end

  def senseFailures #Checks if the player has done anything that should trigger
    if (@currentScene.failCase && @currentScene.checkFail)#a game over. Scenes
        puts 'A horde of guards burst into the room!'#will have a field that 
        puts 'You are forcibly escorted to the dungeons.'#tells whether or not
        @done = true                                 #game over can occur.
    end
  end

  def libCase(obj) #Handling a case in which examining one item yields another.
    if (@currentScene.name == 'library')
      if (obj.name == 'desk' && !obj.looked)
        d = Diary.new
        @player.takeItem(d)
      end
    end
  end

  def dunCase #handling a case where accomplishing the task of knocking out the
    if (@currentScene.name == 'dungeon')#guard allows player to find a key 
      if (@currentScene.flattered)      #in the throne room
        tr = getScene('throne-room')
        tp = tr.getObject('paintings')
        tp.lookKey = true
      end
    end
  end

  def getKey(ob) #Another case where examining one object yields another
    if (@currentScene.name == 'throne-room' && ob.name == 'paintings')
      if (ob.foundKey && !(@player.inBag('key')))
        k = Key.new
        @player.takeItem(k)
      end
    end
  end

  def doorCase(ob) #Case where unlocking the door yields the treasure chest item
    if (@currentScene.name == 'dungeon' && ob == 'door')
      door = @currentScene.getObject('door')
      if(door.unlocked && !@player.inBag('key'))
        t = TreasureChest.new
        @player.takeItem(t)
      end
    end
  end

    
end

