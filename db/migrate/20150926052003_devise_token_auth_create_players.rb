class DeviseTokenAuthCreatePlayers < ActiveRecord::Migration
  def change
    change_table(:players) do |t|
      ## Required
      t.string :provider, :null => false, :default => "email"
      t.string :uid, :null => false, :default => ""

      ## Tokens
      t.text :tokens
    end

    #add_index :players, :email
    add_index :players, [:uid, :provider],     :unique => true
    #add_index :players, :reset_password_token, :unique => true
    # add_index :players, :confirmation_token,   :unique => true
    # add_index :players, :unlock_token,         :unique => true
  end
end
