class Ability
  include CanCan::Ability 

  def initialize(user)
    user ||= User.new
    
    if user.role? :admin
      can :manage, :all
    
    elsif user.role? :manager
      # read any information in the system
      can :read, :all

      # can create, edit and read employee data.
      can :update, User, role: "shipper"
      can :create, User, role: "shipper"

      can :update, User, role: "manager"
      can :create, User, role: "manager"

      # can create, edit and read items in the system
      can :update, Item
      can :create, Item
      can :destroy, Item

      # can read full price history of a particular item as well as 
      # create new prices for a particular item.
      can :create, ItemPrice

      # can adjust the inventory levels for an item by adding purchases 
      # to the system
      can :create, Purchase
    
    elsif user.role? :shipper
      # read their own personal information in the system
      can :read, User, id: user.id 

      # edit their own name, phone, email and password information
      can :edit, User, id: user.id

      # can read information related to orders that need to be shipped 
      # from their home page
      can :read, OrderItem, shipped_on: nil

      # can mark when an item has been packed and shipped
      can :update, OrderItem, shipped_on: nil

      # can read information about items, including the inventory 
      # level but not the price history
      can :read, Item

    elsif user.role? :customer
      # read their own personal information in the system
      can :read, User, id: user.id 

      # edit their own name, phone, email and password information
      can :edit, User, id: user.id

      # can place new orders and can cancel unshipped orders
      can :create, Order
      can :destroy, Order

      # can read information about items 
      can :read, Item
      can :boards, Item
      can :pieces, Item
      can :clocks, Item
      can :supplies, Item

      # can see a list of their own past orders 
      can :read, Order, user_id: user.id

      # can add their schools
      can :create, School

    else
      can :read, Item
      can :create, User
    end


    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
