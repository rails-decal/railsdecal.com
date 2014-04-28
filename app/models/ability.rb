class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    alias_action :index, :show, to: :view

    if user.is_current_staff?
      can :manage, :all
    elsif user.enabled?
      can :show, User, id: user.id
      can :view, Lecture
    else
    end
  end
end
