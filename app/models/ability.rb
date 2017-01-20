class Ability
  include CanCan::Ability

  def initialize(current_user, options = {})
    current_user ||= User.new
    
    if current_user.admin?
        can :manage, :all
    elsif current_user.coor?
        can :manage, User
    else
        can :read, LessonLevel do |lesson_level|
            current_user.lesson.lesson_level.id >= lesson_level.id
        end
        can :read, Level do |level|
            current_user.level.number >= level.number
        end
        can :read, Audio do |audio|
            if not audio.level.nil?
                current_user.level.number >= audio.level.number
            elsif not audio.lesson.nil?
                current_user.lesson.number >= audio.lesson.number
            elsif not audio.auth_level.nil?
                current_user.level.number >= audio.auth_level
            else
                true
            end
        end
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
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
