class Role < ActiveRecord::Base
  belongs_to :semester
  belongs_to :user
  belongs_to :position
end
