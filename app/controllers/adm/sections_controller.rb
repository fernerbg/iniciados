class Adm::SectionsController < Adm::BaseController
  belongs_to :book, optional: true
  def new
    @section = Section.new
    3.times { @section.chapters.build }
  end
  
  def update
    update! {adm_book_sections_path(@section.book)}
  end
  
  private
    def section_params
      params.require(:section).permit(:title, :start_page, :level_id, chapters_attributes: [:id, :title, :start_page, :_destroy])
    end
end