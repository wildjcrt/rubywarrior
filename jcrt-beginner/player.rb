class Player
  def initialize
    @health = 20
  end
  
  def play_turn(warrior)
    if archer_detect(warrior.health)
      if warrior.feel.enemy?
        warrior.attack!
      else
        warrior.walk!
      end
    else
      if warrior.feel.enemy?
        warrior.attack!
      elsif warrior.feel.captive?
        warrior.rescue!
      elsif warrior.health < 20
        warrior.rest!
      else
        warrior.walk!
      end
    end
    
    @health = warrior.health
  end
  
  def archer_detect(current_health)
    (@health > current_health) ? (return true) : (return false)
  end
end
