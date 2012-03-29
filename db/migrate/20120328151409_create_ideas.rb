class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :target
      t.string :need_statement
      t.string :product_name
      t.string :product_cat
      t.string :benefit_statement
      t.string :alternative
      t.string :differentiation

      t.timestamps
    end
  end
end
