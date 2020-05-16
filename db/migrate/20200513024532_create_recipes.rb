class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      # values
      t.string :name, null: false
      t.string :base, null: false
      t.integer :cook_time, null: false
      t.integer :servings, null: false
      
      # relationships
      t.belongs_to :meal, null: false, foreign_key: true
      t.belongs_to :cuisine, null: false, foreign_key: true
      t.belongs_to :user, null:false, foreign_key: true
      
      t.timestamps
    end
  end
end
