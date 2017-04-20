class Ability
  include CanCan::Ability

  def initialize(user)
    if user.try(:admin)
      can :manage, :all
    else
      can :manage, Profile do |profile|
        user == profile.user
      end
      can [:read, :rate, :rating], Church
      can [:read, :rate, :rating], Pastor
      can [:read, :rate, :rating], School
      can [:read, :rate, :rating], Lecturer
      can [:read, :rate, :rating], Politician
      can [:read, :rate, :rating], Brand
      can :read, Tag
      cannot :index, Tag
    end
  end
end
