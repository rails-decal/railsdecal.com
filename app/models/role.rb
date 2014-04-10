class Role < ActiveRecord::Base
  belongs_to :semester
  belongs_to :user
end
