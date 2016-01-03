class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    alias_action :index, :show, to: :view
    alias_action :new, :create, to: :apply

    can :create, CheckIn
    can :view, Lecture
    can :view, Assignment
    can :view, Semester

    if user.is_current_instructor?
      can :manage, :all
    elsif user.is_current_staff?
      can :manage, :all
      cannot [:apply, :destroy, :update], Semester
    elsif user.enabled?
      can [:show, :update], User, id: user.id
      can [:create, :read, :update], AssignmentSubmission, user_id: user.id
    elsif !user.new_record?
      can :apply, StudentApplication if !user.submitted_current_semester_application?
    end
  end
end
