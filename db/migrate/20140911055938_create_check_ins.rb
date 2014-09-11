class CreateCheckIns < ActiveRecord::Migration
  def change
    create_table :check_ins do |t|
      t.references :user
      t.references :check_in_code

      t.timestamps
    end
  end
end
