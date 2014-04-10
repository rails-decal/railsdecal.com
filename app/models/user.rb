class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :roles

  def current_role
    self.roles.where(semester: Semester.current)
  end

  def is_staff?
    self.current_role.name == "Instructor" || self.current_role.name == "TA"
  end

end
