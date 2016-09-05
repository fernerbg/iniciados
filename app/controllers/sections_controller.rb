class SectionsController < InheritedResources::Base

  private

    def section_params
      params.require(:section).permit(:title, :start_page, :level_id)
    end
end

