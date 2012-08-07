class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :weapon
      t.integer :armor
      t.integer :gold
      t.integer :max_hp
      t.integer :cur_hp
      t.integer :score
      t.timestamps
    end
  end
end
