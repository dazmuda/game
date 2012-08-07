class Mob < ActiveRecord::Base
  attr_accessible :mob_name, :mob_damage, :mob_armor, :mob_gold, :mob_max_hp, :mob_cur_hp, :mob_hit

# mob_types = []
# filled with hashes of each MOBHARDNESS's range of stats
# def mob_types(armor,damage,max_hp,etc...)
# { :damage => damage, :armor => armor, :etc...}
# end
# later, call mob_types.sample to grab one

  def rando(mob_id)
    @mob = Mob.find(mob_id)
    random_val = rand(1..5).to_i
    if random_val == 1 
      @mob.mob_damage = rand(2..3)
      @mob.mob_armor = rand(2..3)
      @mob.mob_max_hp = rand(5..7)
      @mob.save
    elsif random_val == 2
      @mob.mob_damage = rand(2..3)
      @mob.mob_armor = rand(2..3)
      @mob.mob_max_hp = rand(8..10)
      @mob.save
    elsif random_val == 3
      @mob.mob_damage = rand(3..4)
      @mob.mob_armor = rand(3..4)
      @mob.mob_max_hp = rand(10..15)
      @mob.save
    elsif random_val == 4
      @mob.mob_damage = rand(4..5)
      @mob.mob_armor = rand(4..5)
      @mob.mob_max_hp = rand(10..15)
      @mob.save
    elsif random_val == 5
      @mob.mob_damage = rand(10..20)
      @mob.mob_armor = rand(10..20)
      @mob.mob_max_hp = rand(30..50)
      @mob.save
    end
    #@mob = Mob.find(mob_id)
    @mob.mob_hit = 0
    @mob.mob_cur_hp = @mob.mob_max_hp.to_i
    @mob.mob_gold = @mob.mob_max_hp.to_i *5
    puts @mob.mob_max_hp
    @mob.save
  end
  
  def fight(mob_id, player_id)
    @player = Player.find(player_id)
    @mob = Mob.find(mob_id)
        
    player_hits_for = @player.weapon.to_i + rand(1..@player.weapon).to_i - @mob.mob_armor.to_i
      if player_hits_for <0
        then player_hits_for = 0
      end
      
    mob_hits_for = @mob.mob_damage.to_i + rand(@mob.mob_damage).to_i - @player.armor.to_i
      if mob_hits_for <0
        then mob_hits_for = 0
      end 

    @mob.mob_cur_hp = @mob.mob_cur_hp.to_i - player_hits_for.to_i
    @mob.mob_hit = mob_hits_for
    @mob.save
    
    @player.cur_hp = @player.cur_hp.to_i - mob_hits_for.to_i
    @player.player_hit = player_hits_for
    @player.save
    
    if @mob.mob_cur_hp <0
      @player.score = @player.score.to_i + 1
      @player.gold = @player.gold.to_i + @mob.mob_gold.to_i
      @player.save
    elsif @player.cur_hp <0
      @mob.mob_cur_hp = @mob.mob_max_hp.to_i
      @mob.save
    end
    
  end
   
end
