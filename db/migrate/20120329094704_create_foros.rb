class CreateForos < ActiveRecord::Migration
  def change
    create_table :foros do |t|
      t.string :titulo
      t.integer :user_id
      
      t.timestamps
    end
  end
end
