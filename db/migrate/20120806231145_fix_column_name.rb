class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :players, :max_hp, :action
  end
end
