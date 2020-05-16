class CreateDayMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :day_meals do |t|
      t.belongs_to :day, null: false, foreign_key: true
      t.belongs_to :meal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
