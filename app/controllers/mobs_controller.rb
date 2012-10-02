class MobsController < ApplicationController
  
# STUFF FOR THE DM
# http://localhost:3000/players/7/mobs/1/edit
# http://localhost:3000/players/7/mobs/new

  def show
    @mob = Mob.find(params[:id])
    @mob.save
    @player = Player.find(params[:player_id])
    @player.save
    @mob.fight(@mob.id, @player.id)
  end

  def index
    @mobs = Mob.all
    @player = Player.find(params[:player_id]) 
  end

  def new
    @mob = Mob.new
  end

  def create
    @mob = Mob.new(params[:mob])
    @mob.save
    #@mob.rando(@mob.id)
    redirect_to player_mobs_path
  end

  def edit
    @mob = Mob.find(params[:id])
  end

  def update
    @player = Player.find(params[:player_id])
    @mob = Mob.find(params[:id])
    @mob.update_attributes(params[:mob])
    redirect_to player_mobs_path
  end

  def destroy
    @player = Player.find(params[:player_id])
    @mob = Mob.find(params[:id])
    @mob.destroy
  end

end
