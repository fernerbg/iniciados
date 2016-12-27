class LevelPagesController < InheritedResources::Base
  
  def new
  
  end
  
  private
    def level_page_params
      params.require(:level_page).permit(:number, :level_id)
    end
  end
end