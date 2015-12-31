class CreateAbsences < ActiveRecord::Migration
  def change
    create_table :absences do |t|
      t.integer :user_id
      t.string :excuse
      t.datetime :time_submitted
      t.timestamps null: false
    end
  end
end
