class UsersController < ApplicationController

  respond_to :html

  def home
    #current_user es una variable de devise
    @user = current_user

  end

  def sign_out
    #current_user es una variable de devise
    logout
  end

end
