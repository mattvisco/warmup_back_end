class IndexNullpass < ActiveRecord::Migration
  def up
      add_index :users, :name, unique: true
      change_column :users, :password, :string, :null => true
  end

  def down
  end
end
