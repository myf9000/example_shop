class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    if user.nil?
        can :read, Product
    elsif user.admin?
        can :manage, :all
    else
        can :read, :all
        can :manage, Product, :user_id => user.id
        can :add, YourBasket 
    end
  end
end


# rolify jest potrzebne do generowania rol innych niz admin, autor, gosc (niezalogowany)