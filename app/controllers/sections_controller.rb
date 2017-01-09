class SectionsController < InheritedResources::Base
  
  def new
    @section = Section.new
    3.times { @section.chapters.build }
  end
  
  private
    def section_params
      params.require(:section).permit(:title, :start_page, :level_id, chapters_attributes: [:id, :title, :start_page, :_destroy])
    end
end