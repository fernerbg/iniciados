class LevelPagesController < ApplicationController
  
  before_action :levels_root
  
  private
    
    def level_page_params
      params.require(:level_page).permit(:number, :level_id)
    end
  
end