class CreateWeeks < ActiveRecord::Migration[6.0]
  def change
    create_table :weeks do |t|
      t.date :start
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
