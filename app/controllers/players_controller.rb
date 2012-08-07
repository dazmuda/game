class PlayersController < ApplicationController

  def show
    @player = Player.find(params[:id])
  end
    
  def index
    @players = Player.all
  end
    
  def new
    @player = Player.new
  end
    
  def create
    @player = Player.new(params[:player])
    @player.save
    @player.init(@player.id)
    redirect_to player_path(@player)
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    @player.update_attributes(params[:player])
    @player.save
    @player.check_buy(@player.id)
    redirect_to player_path(@player)
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to players_path
  end
      
end
