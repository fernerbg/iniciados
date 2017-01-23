class LevelSectionsController < InheritedResources::Base

  private

    def level_section_params
      params.require(:level_section).permit(:section_id, :level_id)
    end
end

