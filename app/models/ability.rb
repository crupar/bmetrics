class Ability
  include CanCan::Ability


  def initialize(user)
    user ||= User.new 
    can [:manage], RegisteredApplication do |registered_app|
      !user.new_record? && registered_app.try(:user) == user
  end
    can :create, RegisteredApplication if !user.new_record?
  end
end
