class CreateMobs < ActiveRecord::Migration
  def change
    create_table :mobs do |t|
      t.string :mob_name
      t.integer :mob_damage
      t.integer :mob_armor
      t.integer :mob_gold
      t.integer :mob_max_hp
      t.integer :mob_cur_hp
      t.timestamps
    end
  end
end
