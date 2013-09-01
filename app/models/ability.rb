class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.role? :admin
      can :manage, :all
    elsif user.role? :uploader
      can :manage, Upload
    elsif user.role? :verifier
      can :manage, Verify
    elsif user.role? :editor
      can :manage, Edit
    elsif user.role? :publisher
      can :manage, Publish
    end
  end

end
