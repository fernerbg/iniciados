class Coor::UsersController < Coor::BaseController
    has_scope :by_name, :by_surname, :by_level_id, :by_lesson_id, :by_email
    
    custom_actions resource: :pass_next_level
    
    def index
        @users = end_of_association_chain.by_headquarter_id(current_user.headquarter.id).includes(:level, :lesson).order(:name)
    end
    
    def edit
        @user = resource
    end
    
    def update
        update! do |format|
            format.html { redirect_to collection_url }
        end
    end
    
    def create
        @user = User.new(user_params)
        @user.password = 'sbabaji7'
        @user.headquarter = current_user.headquarter
        create! do |format|
            format.html { redirect_to collection_url }
        end
    end
    
    def pass_next_level
        resource.pass_next_level
        resource.save
        redirect_to collection_url(params)
    end
    
    def pass_next_lesson
        resource.pass_next_lesson
        resource.save
        redirect_to collection_url(params)
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name, :surname, :email, :level_id, :lesson_id)
    end
end