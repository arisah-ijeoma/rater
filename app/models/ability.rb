class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin
      can :manage, :all
    else
      can :manage, Profile do |profile|
        user == profile.user
      end
    end
  end
end
