class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    alias_action :index, :show, to: :view
    alias_action :new, :create, to: :apply

    if user.is_current_staff?
      can :manage, :all
    elsif user.enabled?
      can :show, User, id: user.id
      can :view, Lecture
      can :apply, StudentApplication if !user.submitted_current_semester_application?
    else # not enabled or not signed in
    end
  end
end
