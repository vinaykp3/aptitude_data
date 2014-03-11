class Ability
  include CanCan::Ability

  def initialize(student)
    can :read,:all
  end
end