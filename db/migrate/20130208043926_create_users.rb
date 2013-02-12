class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
        t.string :name, :limit => 128, :null => false
        t.string :password, :limit => 128
        t.integer :count, :default => 1

      t.timestamps
    end
  end
end
