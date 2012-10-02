class Player < ActiveRecord::Base
  attr_accessible :name, :weapon, :armor, :gold, :action, :cur_hp, :score, :player_hit
  
  def init(player_id)
    @player = Player.find(player_id)
    @player.cur_hp = 10
    @player.weapon = 2
    @player.armor = 2
    @player.gold = 100
    @player.action = 0
    @player.score = 0
    @player.player_hit = 0
    @player.save
  end
  
  def check_buy(player_id)
    @player = Player.find(player_id)
    if (@player.action == 1 && @player.gold.to_i>=50)
      @player.weapon = @player.weapon.to_i + 1
      @player.gold = @player.gold.to_i - 50
      @player.save
    elsif (@player.action == 2 && @player.gold.to_i>=50)
      @player.armor = @player.armor.to_i + 1
      @player.gold = @player.gold.to_i - 50
      @player.save
    elsif (@player.action == 3 && @player.gold.to_i>=10)
      @player.cur_hp = @player.cur_hp.to_i + 5
      @player.gold = @player.gold.to_i - 10
      @player.save
    end
  end  
  
end
