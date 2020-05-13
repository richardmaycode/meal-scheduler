class CreateCuisines < ActiveRecord::Migration[6.0]
  def change
    create_table :cuisines do |t|
      t.string :name, null: false
      t.integer :status, null: false

      t.timestamps
    end
  end
end
