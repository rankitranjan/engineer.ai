# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user
        if user.role == "admin"
            can :manage, :all
        else
            cannot :manage, SecretCode
        end
    end
  end

end
