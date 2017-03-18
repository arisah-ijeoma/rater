class Ability
  include CanCan::Ability

  def initialize(user)
    if user.try(:admin)
      can :manage, :all
    else
      can :manage, Profile do |profile|
        user == profile.user
      end
      can :manage, Heart
      can :read, Church
      can :read, Pastor
      can :read, School
      can :read, Lecturer
    end
  end
end
