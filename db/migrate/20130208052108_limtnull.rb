class Limtnull < ActiveRecord::Migration
  def up
      change_column :users, :password, :string, {:limit =>128,:null => true}
      change_column :users, :name, :string, {:limit =>128,:null => false}
      change_column :users, :count, :integer, {:default => 1}
  end

  def down
  end
end
