class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username, null: false, unique: true
      t.string :name, null: false
      t.integer :default_servings, null: false
      
      t.timestamps
    end
    add_index :users, :username, unique: true
  end
end
