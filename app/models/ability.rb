class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    #
    can %i[read tractors_by_popular tractors_by_price], Tractor
    return unless user.present?
    return unless user.admin?

    can :manage, :all
  end
end
