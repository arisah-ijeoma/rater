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
      can [:read, :rating, :ratings], Church
      can [:read, :rating, :ratings], Pastor
      can :read, School
      can :read, Lecturer
      can :read, Politician
      can :read, Brand
    end
  end
end
