class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    alias_action :index, :show, to: :view
    alias_action :new, :create, to: :apply

    can :create, CheckIn
    can :view, Lecture
    can :view, Assignment
    can :view, Absence

    if user.is_current_staff?
      can :manage, :all
    elsif user.enabled?
      can [:show, :update], User, id: user.id
      can [:create, :read, :update], AssignmentSubmission, user_id: user.id
      can [:create, :read, :update], Absence, user_id: user.id
    elsif !user.new_record?
      can :apply, StudentApplication if !user.submitted_current_semester_application?
    end
  end
end
