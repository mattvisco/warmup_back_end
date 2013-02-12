class RemoveAddIndex < ActiveRecord::Migration
  def up
      #add_index "users", ["name"], :name => "index_users_on_name", :unique => true
  end

  def down
  end
end
