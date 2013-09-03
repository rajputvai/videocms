class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.role? :admin
      can :manage, :all
    elsif user.role? :uploader
      can :manage, :upload
    elsif user.role? :verifier
      can :manage, :verify
    elsif user.role? :editor
      can :manage, :edit
    elsif user.role? :publisher
      can :manage, :publish
    end
  end

end
