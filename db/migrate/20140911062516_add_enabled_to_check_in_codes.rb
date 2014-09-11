class AddEnabledToCheckInCodes < ActiveRecord::Migration
  def change
    add_column :check_in_codes, :enabled, :boolean, default: false
  end
end
