class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.integer :year
      t.string :semester
      t.integer :number
      t.string :title
      t.string :partial

      t.timestamps
    end
  end
end
