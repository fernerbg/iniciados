class UsersController < ApplicationController

  respond_to :html

  def home
    #current_user es una variable de devise
    @user = current_user

  end

end
