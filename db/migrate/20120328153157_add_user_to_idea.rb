class AddUserToIdea < ActiveRecord::Migration
  def up
    add_column :ideas, :user_id, :integer, :null => :false
  end
  
  def down
    remove_column :ideas, :user_id
  end
end
