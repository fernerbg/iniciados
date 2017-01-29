class Adm::ChaptersController < Adm::BaseController

  private

    def chapter_params
      params.require(:chapter).permit(:title, :start_page, :section_id)
    end
end