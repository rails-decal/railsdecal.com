class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    alias_action :index, :show, to: :view
    alias_action :new, :create, to: :apply

    can :create, CheckIn
    can :view, Lecture
    can :show, User, id: user.id

    if user.is_current_staff?
      can :manage, :all
    #Readd when enabled is added.
    #elsif user.enabled?
    #  can :show, User, id: user.id
    elsif !user.new_record? # signed in but not enabled
      can :apply, StudentApplication if !user.submitted_current_semester_application?
    end
  end
end
