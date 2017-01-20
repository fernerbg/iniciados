class Coor::BaseController < ApplicationController
    inherit_resources
    before_filter do
        authorize! :manage, User
    end

end