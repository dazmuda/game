class AddHitToMobs < ActiveRecord::Migration
  def change
    add_column :mobs, :mob_hit, :integer
  end
end
