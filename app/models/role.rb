# == Schema Information
#
# Table name: roles
#
#  id          :integer          not null, primary key
#  name        :string
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer
#  semester_id :integer
#  position_id :integer
#

class Role < ActiveRecord::Base
  belongs_to :semester
  belongs_to :user
  belongs_to :position

  before_create :set_name

  INSTRUCTOR = "Instructor"
  TA = "TA"
  STUDENT = "Student"
  OBSERVER = "Observer"

  def set_name
    self.name = self.position.name
  end

  def update_position(position)
    self.position = position
    self.set_name
    self.save!
  end

end
