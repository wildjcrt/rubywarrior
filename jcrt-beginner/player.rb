class Player
  def initialize
    @health = 20
    @rescue_captive = false
  end
  
  def play_turn(warrior)
    unless @rescue_captive
      if warrior.feel(:backward).captive?
        warrior.rescue!(:backward)
        @rescue_captive = true
      else
        warrior.walk!(:backward)
      end
      
      return true
    end
    
    if archer_detect(warrior)
      if warrior.feel.enemy?
        warrior.attack!
      elsif warrior.health < 10
        warrior.walk!(:backward)
      else
        warrior.walk!
      end
    else
      if warrior.feel.enemy?
        warrior.attack!
      elsif warrior.health < 20
        warrior.rest!
      else
        warrior.walk!
      end
    end
  end
  
  def archer_detect(warrior)
    if @health > warrior.health
      @health = warrior.health
      return true
    else
      @health = warrior.health
      return false
    end
  end
end