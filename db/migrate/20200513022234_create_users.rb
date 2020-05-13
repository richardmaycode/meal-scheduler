class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :name, null: false
      t.integer :default_servings, null: false
      
      t.timestamps
    end
  end
end
