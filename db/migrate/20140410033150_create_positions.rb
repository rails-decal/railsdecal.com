class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|

      t.timestamps
    end
  end
end
