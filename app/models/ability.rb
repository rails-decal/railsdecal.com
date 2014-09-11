class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    alias_action :index, :show, to: :view
    alias_action :new, :create, to: :apply

    can :create, CheckIn

    if user.is_current_staff?
      can :manage, :all
    elsif user.enabled?
      can :show, User, id: user.id
      can :view, Lecture
    elsif !user.new_record? # signed in but not enabled
      can :apply, StudentApplication if !user.submitted_current_semester_application?
    end
  end
end
