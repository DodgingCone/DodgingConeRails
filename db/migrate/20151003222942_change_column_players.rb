class ChangeColumnPlayers < ActiveRecord::Migration
  def change
    add_index :players, :username, unique: true
    change_column_null :players, :username, false
  end
end
