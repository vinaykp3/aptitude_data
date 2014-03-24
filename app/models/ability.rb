class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.roles? :admin
      can :manage, :all
      cannot :select_topic, Question
    else
      can [:read,:create],:all
      can :test_saved,Score
      can :student_result,Question
      can :select_topic,Question
      cannot :create,Question
      cannot :create,Topic
    end
  end
end