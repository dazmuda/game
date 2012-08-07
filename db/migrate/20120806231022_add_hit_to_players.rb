class AddHitToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :player_hit, :integer
  end
end
