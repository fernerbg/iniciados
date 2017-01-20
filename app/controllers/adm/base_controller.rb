class Adm::BaseController < ApplicationController
    inherit_resources
    
    before_filter do
        authorize! :manage, resource_class
    end

end