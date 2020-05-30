class CreateDays < ActiveRecord::Migration[6.0]
  def change
    create_table :days do |t|
      t.date :scheduled, null: false
      t.integer :plans_needed, null: false
      t.boolean :allow_long_cook_times, default: false
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :week, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
