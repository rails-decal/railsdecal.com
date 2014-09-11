class CheckIn < ActiveRecord::Base
  belongs_to :user
  belongs_to :check_in_code
end
