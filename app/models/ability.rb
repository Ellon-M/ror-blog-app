class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    return unless user.present?

    if user.is? :admin
      can :manage, :all
    else
      can :destroy, Post do |post|
        post.author == user
      end

      can %i[read create like], :all
    end
  end
end
