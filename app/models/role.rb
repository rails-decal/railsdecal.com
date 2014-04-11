class Role < ActiveRecord::Base
  belongs_to :semester
  belongs_to :user
  belongs_to :position

  before_create :set_name

  def set_name
    self.name = self.position.name
  end

end
