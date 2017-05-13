class Adm::UsersController < Adm::BaseController
    def import
        excel = params[:file]
    end
    
    def import_new
        
    end
end