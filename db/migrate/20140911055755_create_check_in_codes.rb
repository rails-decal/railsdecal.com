class CreateCheckInCodes < ActiveRecord::Migration
  def change
    create_table :check_in_codes do |t|
      t.string :code
      t.date :class_date

      t.timestamps
    end
  end
end
